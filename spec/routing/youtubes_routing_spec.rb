require "spec_helper"

describe YoutubesController do
  describe "routing" do

    it "routes to #index" do
      get("/youtubes").should route_to("youtubes#index")
    end

    it "routes to #new" do
      get("/youtubes/new").should route_to("youtubes#new")
    end

    it "routes to #show" do
      get("/youtubes/1").should route_to("youtubes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/youtubes/1/edit").should route_to("youtubes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/youtubes").should route_to("youtubes#create")
    end

    it "routes to #update" do
      put("/youtubes/1").should route_to("youtubes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/youtubes/1").should route_to("youtubes#destroy", :id => "1")
    end

  end
end
