require "spec_helper"

describe NewestFashionsController do
  describe "routing" do

    it "routes to #index" do
      get("/newest_fashions").should route_to("newest_fashions#index")
    end

    it "routes to #new" do
      get("/newest_fashions/new").should route_to("newest_fashions#new")
    end

    it "routes to #show" do
      get("/newest_fashions/1").should route_to("newest_fashions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/newest_fashions/1/edit").should route_to("newest_fashions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/newest_fashions").should route_to("newest_fashions#create")
    end

    it "routes to #update" do
      put("/newest_fashions/1").should route_to("newest_fashions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/newest_fashions/1").should route_to("newest_fashions#destroy", :id => "1")
    end

  end
end
