require 'debugger'
class VideosController < ApplicationController

  def submit_video
  end

  def featured_videos
  end


  def watch
    @url = params[:url]
    @vid_metadata = params[:vid_metadata]
    @img = params[:img]
  end

end
