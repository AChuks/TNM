require "spec_helper"

describe ComediesController do
  describe "routing" do

    it "routes to #index" do
      get("/comedies").should route_to("comedies#index")
    end

    it "routes to #new" do
      get("/comedies/new").should route_to("comedies#new")
    end

    it "routes to #show" do
      get("/comedies/1").should route_to("comedies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/comedies/1/edit").should route_to("comedies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/comedies").should route_to("comedies#create")
    end

    it "routes to #update" do
      put("/comedies/1").should route_to("comedies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/comedies/1").should route_to("comedies#destroy", :id => "1")
    end

  end
end
