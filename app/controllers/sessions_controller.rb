class SessionsController < ApplicationController
  
  def new
    if logged_in?
      respond_to do |format|
        format.html {redirect_to admin_path }
      end
    end
  end

  def create
    respond_to do |format|
      session = params[:session]
      user = User.find_by(email: session[:email].downcase)
      if user && user.authenticate(session[:password])
        log_in(user)
        remember(user)
        format.html {redirect_to admin_path}
      else 
        flash.now[:danger] = 'Invalid email/password combination'
        format.html { render :new }
      end
    end
  end

  def destroy
    log_out if logged_in?
    respond_to do |format|
      format.html { redirect_to admin_login_path}
    end
  end

end
