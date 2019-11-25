class VideosController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /videos
  # GET /videos.json
  def index
    @logged_in = logged_in?
    if @logged_in
      @videos = Video.all
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

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)
    puts video_params
    @video.date = Time.now

    respond_to do |format|
      if @video.save

        # Send video received email
        begin
          SendinBlueMailer.send_video_received_email(@video).deliver_now
        rescue SibApiV3Sdk::ApiError => e
          puts "Exception when calling SMTPApi->send_transac_email: #{e}"
        end

        pre_video_upload_data
        @videos_info['videoUploadSuccess'] = true
        format.html { render action: 'new' }
        format.json { render json: @videos_info }
      else
        pre_video_upload_data
        @videos_info['videoUploadSuccess'] = false
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
          update_video
        end
      end
    else
      update_video
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
      @videos = Video.all
      format.html { render action: 'index' }
      format.json { render json: @videos }
    end
  end

  def watch
    @url = params[:url]
    @title = params[:title]
    @meta_data = params[:meta_data]
    @uploaded = params[:upload]
    if @uploaded
      @current_video_relation =  Video.same_vimeo_video_id_as(@url)
      @current_video = @current_video_relation.first
      @related_videos = view_context.get_related_videos(@current_video['author_email'])
    elsif
      @related_videos = view_context.get_related_youtube_videos(@meta_data).order("RANDOM()")[0,20]
      @current_video_relation =  Youtube.same_url_as(@url)
      @current_video = @current_video_relation.first
    end
    @trending_videos = view_context.get_trending_videos
    @videos_info = {url: @url, title: @title, uploaded: @uploaded, currentVideo: @current_video, relatedVideos: @related_videos}
  end

  def accept
    @video = Video.find_by(id: params[:id])
    # Send video accepted email
    if !@video.accepted 
      SendinBlueMailer.send_video_accepted_email(@video).deliver_now
      @video.update({accepted: true})
    end
    respond_to do |format|
       @videos = Video.all
      format.html { render action: 'index' }
      format.json { render json: @videos }
    end
  end

  def processed
    @video = Video.find_by(id: params[:id])
    @video.update({processed: true})
    respond_to do |format|
      @videos = Video.all
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
      params.require(:video).permit(:url, :title, :description, :author, :author_email, :vimeo_video_id, :frame, :agreed_to_vid_sub_policy)
    end

    def pre_video_upload_data
      @video = Video.new
      @s3_direct_post = S3_BUCKET.presigned_post(key: "videoUploads/#{Time.now.getlocal('-05:00').to_date}/#{SecureRandom.uuid}/${filename}", success_action_status: '201')
      @videos_info = {video: @video, presignedS3Post: @s3_direct_post, policy: @s3_direct_post.fields }
    end

    def update_video
      respond_to do |format|
        if @video.update(video_params)
          format.html { render action: 'edit' }
          format.json { render json: {video: @video, videoUploadSuccess: true }}
        else
          format.html { render action: 'edit' }
          format.json { render json: {video: @video, videoUploadSuccess: false}}
        end
      end
    end
end
