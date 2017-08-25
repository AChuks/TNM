class AdminsController < ApplicationController
	
  def index
  	if !logged_in?
  		respond_to do |format|
  			format.html {redirect_to admin_login_path }
  		end
  	else
  		respond_to do |format |
  			format.html { redirect_to videos_path }
  		end
  	end
  end

end
