require "spec_helper"

describe TrendVideosController do
  describe "routing" do

    it "routes to #index" do
      get("/trend_videos").should route_to("trend_videos#index")
    end

    it "routes to #new" do
      get("/trend_videos/new").should route_to("trend_videos#new")
    end

    it "routes to #show" do
      get("/trend_videos/1").should route_to("trend_videos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/trend_videos/1/edit").should route_to("trend_videos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/trend_videos").should route_to("trend_videos#create")
    end

    it "routes to #update" do
      put("/trend_videos/1").should route_to("trend_videos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/trend_videos/1").should route_to("trend_videos#destroy", :id => "1")
    end

  end
end
