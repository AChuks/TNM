class TrendFashionsController < ApplicationController
   prepend_view_path 'app/views/fashion'
  before_action :set_trend_fashion, only: [:show, :edit, :update, :destroy]

  # GET /trend_fashions
  # GET /trend_fashions.json
  def index
    @trend_fashions = TrendFashion.all
  end

  # GET /trend_fashions/1
  # GET /trend_fashions/1.json
  def show
  end

  # GET /trend_fashions/new
  def new
    @trend_fashion = TrendFashion.new
  end

  # GET /trend_fashions/1/edit
  def edit
  end

  # POST /trend_fashions
  # POST /trend_fashions.json
  def create
    @trend_fashion = TrendFashion.new(trend_fashion_params)

    respond_to do |format|
      if @trend_fashion.save
        format.html { redirect_to @trend_fashion, notice: 'Trend fashion was successfully created.' }
        format.json { render action: 'show', status: :created, location: @trend_fashion }
      else
        format.html { render action: 'new' }
        format.json { render json: @trend_fashion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trend_fashions/1
  # PATCH/PUT /trend_fashions/1.json
  def update
    respond_to do |format|
      if @trend_fashion.update(trend_fashion_params)
        format.html { redirect_to @trend_fashion, notice: 'Trend fashion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @trend_fashion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trend_fashions/1
  # DELETE /trend_fashions/1.json
  def destroy
    @trend_fashion.destroy
    respond_to do |format|
      format.html { redirect_to trend_fashions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trend_fashion
      @trend_fashion = TrendFashion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trend_fashion_params
      params.require(:trend_fashion).permit(:url, :mdata, :img)
    end
end
