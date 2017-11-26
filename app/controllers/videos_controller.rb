class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /videos
  # GET /videos.json
  def index
    if logged_in?
      @videos = initialize_grid(Video)
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
    @video = Video.new
    @s3_direct_post = S3_BUCKET.presigned_post(key: "videoUploads/#{Time.now.getlocal('-05:00').to_date}/#{SecureRandom.uuid}/${filename}", success_action_status: '201')
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)
    @video.date = Time.now

    respond_to do |format|
      if @video.save

        # Send video received email
        MandrillMailer.send_video_received_email(@video).deliver_now

        format.html { redirect_to @video, notice: 'Video was successfully submitted. Thank You.' }
        format.json { render action: 'show', status: :created, location: @video }
      else
        format.html { render action: 'new' }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # Custom behaviour
  # Marks record as deleted. Doesn't delete record in db
  def destroy
    @vide.update({deleted: true})
    S3.delete_object({
      bucket: ENV['S3_BUCKET_NAME'],
      # Fix this regex if bucket name/folders gets changed in s3
      key: @video.url[@video.url.index('/v')+1..@video.url.length]
    })
    respond_to do |format|
      format.html { redirect_to videos_url }
      format.json { head :no_content }
    end
  end

  def watch
    @url = params[:url]
    @title = params[:title]
    @meta_data = params[:meta_data]
    @related_videos = view_context.get_related_videos(@meta_data).order("RANDOM()")[0,20]
    @trending_videos = view_context.get_trending_videos
    @current_video_relation =  Youtube.same_url_as(@url)
    @current_video = @current_video_relation.first
  end

  def preview
    @video = Video.find_by(id: params[:id])
    respond_to do |format|               
      format.js {render 'videos/uploads/preview'}
      format.html { render 'videos/uploads/preview' }
    end  
  end

  def accept
    @video = Video.find_by(id: params[:id])
    # Send video accepted email
    if !@video.accepted 
      MandrillMailer.send_video_accepted_email(@video).deliver_now
      @video.update({accepted: true})
    end
    respond_to do |format|
      format.html { redirect_to videos_url }
      format.json { head :no_content }
    end
  end

  def processed
    @video = Video.find_by(id: params[:id])
    @video.update({processed: true})
    respond_to do |format|
      format.html { redirect_to videos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:url, :title, :description, :author, :author_email, :youtube_url)
    end
end
