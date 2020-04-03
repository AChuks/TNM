class PagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def status 
    @logged_in = logged_in?
    respond_to do |format|
      @search_return_action = search_return_action
      format.html { render action: @search_return_action }
      format.json { render json: {loggedIn: @logged_in} }
    end
  end

  def home
    @update = params[:update]
    @videos_info = view_context.get_all_videos(@update)
    respond_to do |format|
      format.html { render action: 'home' }
      format.json { render json: @videos_info }
    end
  end

  def contact
  end

  def submit_contact_info
    respond_to do |format|
      # Send contact form message
      begin
        result = SendinBlueMailer.send_contact_message(contact_form_params).deliver_now
        format.html { render action: 'contact' }
        format.json { render json: {success: true}}
      rescue SibApiV3Sdk::ApiError => e
        puts "Exception when calling SMTPApi->send_transac_email: #{e}"
        format.html { render action: 'contact' }
        format.json { render json: {success: false}}
      end
    end
  end

  def search
    @search_text = search_params[:search_text]
    @videos_info = view_context.get_search_filtered_videos(@search_text)
    respond_to do |format|
      format.html { render action: 'search' }
      format.json { render json: @videos_info }
    end
  end

  def advertise
  end

  def about
  end

  def subscribe
  end

  def terms
  end

  def privacy
  end

  def sitemap
    redirect_to "https://#{ENV['FOG_DIRECTORY']}.s3.us-east-2.amazonaws.com/sitemaps/sitemap.xml.gz"
  end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_form_params
      params.permit(:first_name, :last_name, :email, :subject, :message)
    end

    def search_params
      params.permit(:search_text, :page)
    end

    def search_return_action 
      http_referrer = request.referer
      if http_referrer.include? 'contact'
        return 'contact'
      elsif http_referrer.include? 'videos'
        return 'videos'
      elsif http_referrer.include? 'search'
        return 'search'
      else
        return 'home' 
      end
    end

end
