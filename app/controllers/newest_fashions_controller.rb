class NewestFashionsController < ApplicationController
  prepend_view_path 'app/views/fashion'
  before_action :set_newest_fashion, only: [:show, :edit, :update, :destroy]

  # GET /newest_fashions
  # GET /newest_fashions.json
  def index
    @newest_fashions = NewestFashion.all
  end

  # GET /newest_fashions/1
  # GET /newest_fashions/1.json
  def show
  end

  # GET /newest_fashions/new
  def new
    @newest_fashion = NewestFashion.new
  end

  # GET /newest_fashions/1/edit
  def edit
  end

  # POST /newest_fashions
  # POST /newest_fashions.json
  def create
    @newest_fashion = NewestFashion.new(newest_fashion_params)

    respond_to do |format|
      if @newest_fashion.save
        format.html { redirect_to @newest_fashion, notice: 'Newest fashion was successfully created.' }
        format.json { render action: 'show', status: :created, location: @newest_fashion }
      else
        format.html { render action: 'new' }
        format.json { render json: @newest_fashion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /newest_fashions/1
  # PATCH/PUT /newest_fashions/1.json
  def update
    respond_to do |format|
      if @newest_fashion.update(newest_fashion_params)
        format.html { redirect_to @newest_fashion, notice: 'Newest fashion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @newest_fashion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newest_fashions/1
  # DELETE /newest_fashions/1.json
  def destroy
    @newest_fashion.destroy
    respond_to do |format|
      format.html { redirect_to newest_fashions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newest_fashion
      @newest_fashion = NewestFashion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def newest_fashion_params
      params.require(:newest_fashion).permit(:url, :mdata, :img)
    end
end
