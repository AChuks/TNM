class PagesController < ApplicationController
  def home
    @all_videos = view_context.get_all_videos()
    @trending_videos = view_context.get_trending_videos()
  end

  def contact
  end

  def submit_contact_info
    respond_to do |format|
      # Send contact form message
      begin
        result = SendinBlueMailer.send_contact_message(contact_form_params).deliver_now
        format.html { redirect_to contact_url, notice: 'success'}
        format.json { render action: 'contact', status: :created }
      rescue SibApiV3Sdk::ApiError => e
        puts "Exception when calling SMTPApi->send_transac_email: #{e}"
        format.html { redirect_to contact_url, notice: 'error' }
        format.json { render action: 'contact', status: :unprocessable_entity }
      end
    end
  end

  def search
    @search_text = search_params[:search_text]
    @filtered_videos = view_context.get_search_filtered_videos(@search_text)
  end

  def advertise
  end

  def about
  end

  def subscribe
  end

  def terms
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
      params.permit(:search_text)
    end

end
