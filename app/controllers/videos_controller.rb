class VideosController < ApplicationController
  include ActionView::Helpers::NumberHelper
  skip_before_action :verify_authenticity_token
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /videos
  # GET /videos.json
  def index
    @logged_in = logged_in?
    if @logged_in
      @videos = Video.not_irl
    else 
      respond_to do |format|
        format.html { redirect_to root_path }
      end
    end
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    #  Only redirect to root if video was created within 2 minutes
    if (Time.now - @video.created_at)/60 > 2
      respond_to do |format|
        format.html { redirect_to root_path }
      end
    end
  end

  # GET /videos/new
  def new
    pre_video_upload_data
  end

  def manual
    @video = Video.new
    @videos_info = {video: @video, manual: true}
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)
    puts video_params
    if !@video['is_irl']
      @video.date = Time.now
    end

    respond_to do |format|
      if @video.save
        VideoView.create(:video_url => @video.url, :views => number_with_delimiter(rand(1000..10000)))
        if !@video['is_youtube']
          # Send video received email
          begin
            SendinBlueMailer.send_video_received_email(@video).deliver_now
            rescue SibApiV3Sdk::ApiError => e
              puts "Exception when calling SMTPApi->send_transac_email: #{e}"
            end
        end
        manual = @video['is_youtube']
        pre_video_upload_data
        @videos_info['videoUploadSuccess'] = true
        @videos_info['manual'] = manual
        format.html { render action: 'new' }
        format.json { render json: @videos_info }
      else
        manual = @video['is_youtube']
        pre_video_upload_data
        @videos_info['videoUploadSuccess'] = false
        @videos_info['manual'] = manual
        format.html { render action: 'new' }
        format.json { render json: @videos_info }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    if video_params.key?('vimeo_video_id')
      vimeo_video = VimeoMe2::Video.new(ENV['VIMEO_ACCESS_TOKEN'], video_params['vimeo_video_id'])
      vimeo_video_thumbnail_sizes = vimeo_video.video['pictures']['sizes']
      vimeo_video_thumbnail_sizes.each do |thumbnail_size|
        if thumbnail_size['width'] > 280 && thumbnail_size['height'] > 160
          thumb_nail = thumbnail_size['link']
          @video.thumb_nail = thumb_nail
          return update_video
        end
      end
    else
      return update_video
    end
  end

  # Custom behaviour
  # Marks record as deleted. Doesn't delete record in db
  def destroy
    @video = Video.find_by(id: params[:id])
    @video.update({deleted: true})
    S3.delete_object({
      bucket: ENV['S3_BUCKET_NAME'],
      # Fix this regex if bucket name/folders gets changed in s3
      key: @video.url[@video.url.index('/v')+1..@video.url.length]
    })
    respond_to do |format|
      @videos = Video.not_irl
      format.html { render action: 'index' }
      format.json { render json: @videos }
    end
  end

  def watch
    @url = params[:url]
    @vid = params[:vid]
    @meta_data = params[:meta_data]
    @uploaded = params[:upload]
    @irl = params[:irl]
    @current_video = {}
    if @uploaded
      @video_relation =  Video.same_vimeo_video_id_as(@vid).first
      @current_video_view = VideoView.includes(:video).same_video_url_as(@video_relation[:url]).first
      @current_video = @current_video_view.video
      @current_video.views = @current_video_view[:views]
      @related_videos = view_context.get_related_videos(@current_video['author_email'], nil)
    else
      @related_videos  = [];
      if !@irl
        @related_videos = view_context.get_related_youtube_videos(@meta_data)[0,20]
      else
        @related_videos = view_context.get_related_videos(nil, true)
      end
      @current_video_view =  @irl ?  VideoView.includes(:video).same_video_url_as(@url).first : VideoView.includes(:youtube).same_youtube_url_as(@url).first
      @current_video = @irl ? @current_video_view.video : @current_video_view.youtube
      @current_video.views = @current_video_view[:views]
    end
    @trending_videos = view_context.get_trending_videos
    @videos_info = {url: @url, title: @current_video[:title], uploaded: @uploaded, currentVideo: @current_video, relatedVideos: @related_videos, views: @current_video.views}
    @current_video_view[:views] =  number_with_delimiter(@current_video_view[:views].delete(',').to_i + 1)
    @current_video_view.save
  end

  def accept
    @video = Video.find_by(id: params[:id])
    # Send video accepted email
    if @video.accepted 
      SendinBlueMailer.send_video_accepted_email(@video).deliver_now
      @video.update({accepted: true})
    end
    respond_to do |format|
       @videos = Video.not_irl
      format.html { render action: 'index' }
      format.json { render json: @videos }
    end
  end

  def processed
    @video = Video.find_by(id: params[:id])
    @video.update({processed: true})
    respond_to do |format|
      @videos = Video.not_irl
      format.html { render action: 'index' }
      format.json { render json: @videos }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:url, :title, :description, :author, :author_email, :vimeo_video_id, :frame, :agreed_to_vid_sub_policy, :is_youtube, :is_irl, :date, :irl, :vid, :meta_data)
    end

    def pre_video_upload_data
      @video = Video.new
      @s3_direct_post = S3_BUCKET.presigned_post(key: "videoUploads/#{Time.now.getlocal('-05:00').to_date}/#{SecureRandom.uuid}/${filename}", success_action_status: '201')
      @videos_info = {video: @video, presignedS3Post: @s3_direct_post, policy: @s3_direct_post.fields }
    end

    def update_video
      respond_to do |format|
        if @video.update(video_params)
          # format.html { render action: 'edit' }
          format.json { render json: {video: @video, videoUploadSuccess: true }}
        else
          # format.html { render action: 'edit' }
          format.json { render json: {video: @video, videoUploadSuccess: false}}
        end
      end
    end
end
