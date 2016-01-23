require "spec_helper"

describe TrendingsController do
  describe "routing" do

    it "routes to #index" do
      get("/trendings").should route_to("trendings#index")
    end

    it "routes to #new" do
      get("/trendings/new").should route_to("trendings#new")
    end

    it "routes to #show" do
      get("/trendings/1").should route_to("trendings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/trendings/1/edit").should route_to("trendings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/trendings").should route_to("trendings#create")
    end

    it "routes to #update" do
      put("/trendings/1").should route_to("trendings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/trendings/1").should route_to("trendings#destroy", :id => "1")
    end

  end
end
