require "spec_helper"

describe NewestVideosController do
  describe "routing" do

    it "routes to #index" do
      get("/newest_videos").should route_to("newest_videos#index")
    end

    it "routes to #new" do
      get("/newest_videos/new").should route_to("newest_videos#new")
    end

    it "routes to #show" do
      get("/newest_videos/1").should route_to("newest_videos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/newest_videos/1/edit").should route_to("newest_videos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/newest_videos").should route_to("newest_videos#create")
    end

    it "routes to #update" do
      put("/newest_videos/1").should route_to("newest_videos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/newest_videos/1").should route_to("newest_videos#destroy", :id => "1")
    end

  end
end
