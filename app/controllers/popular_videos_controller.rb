class PopularVideosController < ApplicationController
  prepend_view_path 'app/views/videos'
  before_action :set_popular_video, only: [:show, :edit, :update, :destroy]

  # GET /popular_videos
  # GET /popular_videos.json
  def index
    @popular_videos = PopularVideo.all
  end

  # GET /popular_videos/1
  # GET /popular_videos/1.json
  def show
  end

  # GET /popular_videos/new
  def new
    @popular_video = PopularVideo.new
  end

  # GET /popular_videos/1/edit
  def edit
  end

  # POST /popular_videos
  # POST /popular_videos.json
  def create
    @popular_video = PopularVideo.new(popular_video_params)

    respond_to do |format|
      if @popular_video.save
        format.html { redirect_to @popular_video, notice: 'Popular video was successfully created.' }
        format.json { render action: 'show', status: :created, location: @popular_video }
      else
        format.html { render action: 'new' }
        format.json { render json: @popular_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /popular_videos/1
  # PATCH/PUT /popular_videos/1.json
  def update
    respond_to do |format|
      if @popular_video.update(popular_video_params)
        format.html { redirect_to @popular_video, notice: 'Popular video was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @popular_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /popular_videos/1
  # DELETE /popular_videos/1.json
  def destroy
    @popular_video.destroy
    respond_to do |format|
      format.html { redirect_to popular_videos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_popular_video
      @popular_video = PopularVideo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def popular_video_params
      params.require(:popular_video).permit(:url, :mdata, :img)
    end
end
