class TalentVideosController < ApplicationController
  prepend_view_path 'app/views/videos'
  before_action :set_talent_video, only: [:show, :edit, :update, :destroy]

  # GET /talent_videos
  # GET /talent_videos.json
  def index
    @talent_videos = TalentVideo.all
  end

  # GET /talent_videos/1
  # GET /talent_videos/1.json
  def show
  end

  # GET /talent_videos/new
  def new
    @talent_video = TalentVideo.new
  end

  # GET /talent_videos/1/edit
  def edit
  end

  # POST /talent_videos
  # POST /talent_videos.json
  def create
    @talent_video = TalentVideo.new(talent_video_params)

    respond_to do |format|
      if @talent_video.save
        format.html { redirect_to @talent_video, notice: 'Talent video was successfully created.' }
        format.json { render action: 'show', status: :created, location: @talent_video }
      else
        format.html { render action: 'new' }
        format.json { render json: @talent_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /talent_videos/1
  # PATCH/PUT /talent_videos/1.json
  def update
    respond_to do |format|
      if @talent_video.update(talent_video_params)
        format.html { redirect_to @talent_video, notice: 'Talent video was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @talent_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /talent_videos/1
  # DELETE /talent_videos/1.json
  def destroy
    @talent_video.destroy
    respond_to do |format|
      format.html { redirect_to talent_videos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_talent_video
      @talent_video = TalentVideo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def talent_video_params
      params.require(:talent_video).permit(:url, :mdata, :img)
    end
end
