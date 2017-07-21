class PagesController < ApplicationController
  def home
    @youtube_videos = view_context.get_youtube_videos()
    @trending_videos = view_context.get_trending_videos()
    @submitted_videos = view_context.get_approved_submitted_videos()
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
