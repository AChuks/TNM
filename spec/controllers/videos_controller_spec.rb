require 'spec_helper'

describe VideosController do

  describe "GET 'trend_videos'" do
    it "returns http success" do
      get 'trend_videos'
      response.should be_success
    end
  end

  describe "GET 'submit_video'" do
    it "returns http success" do
      get 'submit_video'
      response.should be_success
    end
  end

  describe "GET 'newest_videos'" do
    it "returns http success" do
      get 'newest_videos'
      response.should be_success
    end
  end

  describe "GET 'music_videos'" do
    it "returns http success" do
      get 'music_videos'
      response.should be_success
    end
  end

end
