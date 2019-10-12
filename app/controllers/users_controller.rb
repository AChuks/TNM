class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token


  # GET /users
  # GET /users.json
  def index
    @logged_in = logged_in?
    if @logged_in
      @users = User.all
    else 
      respond_to do |format|
        format.html { redirect_to root_path }
      end
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user  = User.find params[:id]
  end

  # GET /users/new
  def new
    @user = User.new
    @users_info = {user: @user}
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      @users_info = {user: @user}
      if @user.save
        @users_info['success'] = true
        format.html { render action: 'new' }
        format.json { render json: @users_info }
      else
         @users_info['success'] = false
         format.html { render action: 'new' }
        format.json { render json: @users_info }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if !user_params[:password].blank? && !user_params[:password_confirmation].blank? && user_params[:current_password].blank?
      raise Exception.new('You must enter your current password to change password')
    end
    if (!@user.authenticate(user_params[:current_password]))
      raise Exception.new('Invalid current password')
    end
    respond_to do |format|
      if @user.update(user_params)
        format.html { render action: 'edit' }
        format.json { render json: {user: @user, success: true }}
      else
        format.html { render action: 'edit' }
        format.json { render json: {user: @user, success: false }}
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:user_name, :email, :password, :password_confirmation, :current_password, :super_admin)
    end
end
