class YoutubesController < ApplicationController
  load_and_authorize_resource
  before_action :set_youtube, only: [:show, :edit, :update, :destroy]

  # GET /youtubes
  # GET /youtubes.json
  def index
    @youtubes = Youtube.all
  end

  # GET /youtubes/1
  # GET /youtubes/1.json
  def show
    @youtube   = Youtube.find params[:id]
  end

  # GET /youtubes/new
  def new
    @youtube = Youtube.new
  end

  # GET /youtubes/1/edit
  def edit
  end

  # POST /youtubes
  # POST /youtubes.json
  def create
    @youtube = Youtube.new(youtube_params)

    respond_to do |format|
      if @youtube.save
        format.html { redirect_to @youtube, notice: 'Youtube was successfully created.' }
        format.json { render action: 'show', status: :created, location: @youtube }
      else
        format.html { render action: 'new' }
        format.json { render json: @youtube.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /youtubes/1
  # PATCH/PUT /youtubes/1.json
  def update
    respond_to do |format|
      if @youtube.update(youtube_params)
        format.html { redirect_to @youtube, notice: 'Youtube was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @youtube.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /youtubes/1
  # DELETE /youtubes/1.json
  def destroy
    @youtube.destroy
    respond_to do |format|
      format.html { redirect_to youtubes_url }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_youtube
      @youtube = Youtube.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def youtube_params
      params.require(:youtube).permit(:url, :title, :date, :meta_data)
    end
end
