class NewestVideosController < ApplicationController
  prepend_view_path 'app/views/videos'
  before_action :set_newest_video, only: [:show, :edit, :update, :destroy]

  # GET /newest_videos
  # GET /newest_videos.json
  def index
    @newest_videos = NewestVideo.all
  end

  # GET /newest_videos/1
  # GET /newest_videos/1.json
  def show
  end

  # GET /newest_videos/new
  def new
    @newest_video = NewestVideo.new
  end

  # GET /newest_videos/1/edit
  def edit
  end

  # POST /newest_videos
  # POST /newest_videos.json
  def create
    @newest_video = NewestVideo.new(newest_video_params)

    respond_to do |format|
      if @newest_video.save
        format.html { redirect_to @newest_video, notice: 'Newest video was successfully created.' }
        format.json { render action: 'show', status: :created, location: @newest_video }
      else
        format.html { render action: 'new' }
        format.json { render json: @newest_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /newest_videos/1
  # PATCH/PUT /newest_videos/1.json
  def update
    respond_to do |format|
      if @newest_video.update(newest_video_params)
        format.html { redirect_to @newest_video, notice: 'Newest video was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @newest_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newest_videos/1
  # DELETE /newest_videos/1.json
  def destroy
    @newest_video.destroy
    respond_to do |format|
      format.html { redirect_to newest_videos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newest_video
      @newest_video = NewestVideo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def newest_video_params
      params.require(:newest_video).permit(:url, :mdata, :img)
    end
end
