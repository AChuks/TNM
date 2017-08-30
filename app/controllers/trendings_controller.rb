class TrendingsController < ApplicationController
  load_and_authorize_resource
  before_action :set_trending, only: [:show, :edit, :update, :destroy]

  # GET /trendings
  # GET /trendings.json
  def index
    @trendings = Trending.all
  end

  # GET /trendings/1
  # GET /trendings/1.json
  def show
    @trending   = Trending.find params[:id]
  end

  # GET /trendings/new
  def new
    @trending = Trending.new
  end

  # GET /trendings/1/edit
  def edit
  end

  # POST /trendings
  # POST /trendings.json
  def create
    @trending = Trending.new(trending_params)

    respond_to do |format|
      if @trending.save
        format.html { redirect_to @trending, notice: 'Trending was successfully created.' }
        format.json { render action: 'show', status: :created, location: @trending }
      else
        format.html { render action: 'new' }
        format.json { render json: @trending.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trendings/1
  # PATCH/PUT /trendings/1.json
  def update
    respond_to do |format|
      if @trending.update(trending_params)
        format.html { redirect_to @trending, notice: 'Trending was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @trending.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trendings/1
  # DELETE /trendings/1.json
  def destroy
    @trending.destroy
    respond_to do |format|
      format.html { redirect_to trendings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trending
      @trending = Trending.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trending_params
      params.require(:trending).permit(:url, :title, :date, :meta_data)
    end
end
