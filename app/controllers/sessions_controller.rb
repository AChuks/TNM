class SessionsController < ApplicationController
  def new
  end

  def create
    respond_to do |format|
      session = params[:session]
      user = User.find_by(user_name: session[:username])
      if user && user.authenticate(session[:password])
        # login
      else 
        format.html { render :new }
        format.json { render json: 'Invalid username/password combination'}
      end
    end
  end

  private 
    def session_params
      params.require(:session).permit(:username, :password)
    end

end
