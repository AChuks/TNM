require "spec_helper"

describe TrendFashionsController do
  describe "routing" do

    it "routes to #index" do
      get("/trend_fashions").should route_to("trend_fashions#index")
    end

    it "routes to #new" do
      get("/trend_fashions/new").should route_to("trend_fashions#new")
    end

    it "routes to #show" do
      get("/trend_fashions/1").should route_to("trend_fashions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/trend_fashions/1/edit").should route_to("trend_fashions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/trend_fashions").should route_to("trend_fashions#create")
    end

    it "routes to #update" do
      put("/trend_fashions/1").should route_to("trend_fashions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/trend_fashions/1").should route_to("trend_fashions#destroy", :id => "1")
    end

  end
end
