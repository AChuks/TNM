class TrendVideosController < ApplicationController
  prepend_view_path 'app/views/videos'
  before_action :set_trend_video, only: [:show, :edit, :update, :destroy]

  # GET /trend_videos
  # GET /trend_videos.json
  def index
    @trend_videos = TrendVideo.all
  end

  # GET /trend_videos/1
  # GET /trend_videos/1.json
  def show
  end

  # GET /trend_videos/new
  def new
    @trend_video = TrendVideo.new
  end

  # GET /trend_videos/1/edit
  def edit
  end

  # POST /trend_videos
  # POST /trend_videos.json
  def create
    @trend_video = TrendVideo.new(trend_video_params)

    respond_to do |format|
      if @trend_video.save
        format.html { redirect_to @trend_video, notice: 'Trend video was successfully created.' }
        format.json { render action: 'show', status: :created, location: @trend_video }
      else
        format.html { render action: 'new' }
        format.json { render json: @trend_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trend_videos/1
  # PATCH/PUT /trend_videos/1.json
  def update
    respond_to do |format|
      if @trend_video.update(trend_video_params)
        format.html { redirect_to @trend_video, notice: 'Trend video was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @trend_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trend_videos/1
  # DELETE /trend_videos/1.json
  def destroy
    @trend_video.destroy
    respond_to do |format|
      format.html { redirect_to trend_videos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trend_video
      @trend_video = TrendVideo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trend_video_params
      params.require(:trend_video).permit(:url, :mdata, :img)
    end
end
