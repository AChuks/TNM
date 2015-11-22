class VideosController < ApplicationController
  def watch
  	@url = params[:url]
    @vid_metadata = params[:vid_metadata]
    @img = params[:img]
  end
end
