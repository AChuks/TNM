require "spec_helper"

describe PopularVideosController do
  describe "routing" do

    it "routes to #index" do
      get("/popular_videos").should route_to("popular_videos#index")
    end

    it "routes to #new" do
      get("/popular_videos/new").should route_to("popular_videos#new")
    end

    it "routes to #show" do
      get("/popular_videos/1").should route_to("popular_videos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/popular_videos/1/edit").should route_to("popular_videos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/popular_videos").should route_to("popular_videos#create")
    end

    it "routes to #update" do
      put("/popular_videos/1").should route_to("popular_videos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/popular_videos/1").should route_to("popular_videos#destroy", :id => "1")
    end

  end
end
