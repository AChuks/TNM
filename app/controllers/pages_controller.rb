class PagesController < ApplicationController
  def home
    @videos = Video.paginate(page: params[:page],:per_page => 30)
  end

  def contact
  end

  def advertise
  end

  def about
  end

  def subscribe
  end

  def terms
  end

end
