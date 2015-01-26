class WebseriesController < ApplicationController
  prepend_view_path 'app/views/videos'
  before_action :set_webseries, only: [:show, :edit, :update, :destroy]

  # GET /webseries
  # GET /webseries.json
  def index
     @webseries = Webseries.paginate(page: params[:page],:per_page => 30)
  end

  # GET /webseries/1
  # GET /webseries/1.json
  def show
  end

  # GET /webseries/new
  def new
    @webseries = Webseries.new
  end

  # GET /webseries/1/edit
  def edit
  end

  # POST /webseries
  # POST /webseries.json
  def create
    @webseries = Webseries.new(webseries_params)

    respond_to do |format|
      if @webseries.save
        format.html { redirect_to @webseries, notice: 'Webseries was successfully created.' }
        format.json { render action: 'show', status: :created, location: @webseries }
      else
        format.html { render action: 'new' }
        format.json { render json: @webseries.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /webseries/1
  # PATCH/PUT /webseries/1.json
  def update
    respond_to do |format|
      if @webseries.update(webseries_params)
        format.html { redirect_to @webseries, notice: 'Webseries was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @webseries.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /webseries/1
  # DELETE /webseries/1.json
  def destroy
    @webseries.destroy
    respond_to do |format|
      format.html { redirect_to webseries_index_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_webseries
      @webseries = Webseries.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def webseries_params
      params.require(:webseries).permit(:url, :string, :metadata, :string, :thumbimg, :string)
    end
end
