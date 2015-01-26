require "spec_helper"

describe TalentVideosController do
  describe "routing" do

    it "routes to #index" do
      get("/talent_videos").should route_to("talent_videos#index")
    end

    it "routes to #new" do
      get("/talent_videos/new").should route_to("talent_videos#new")
    end

    it "routes to #show" do
      get("/talent_videos/1").should route_to("talent_videos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/talent_videos/1/edit").should route_to("talent_videos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/talent_videos").should route_to("talent_videos#create")
    end

    it "routes to #update" do
      put("/talent_videos/1").should route_to("talent_videos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/talent_videos/1").should route_to("talent_videos#destroy", :id => "1")
    end

  end
end
