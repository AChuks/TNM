require "spec_helper"

describe WebseriesController do
  describe "routing" do

    it "routes to #index" do
      get("/webseries").should route_to("webseries#index")
    end

    it "routes to #new" do
      get("/webseries/new").should route_to("webseries#new")
    end

    it "routes to #show" do
      get("/webseries/1").should route_to("webseries#show", :id => "1")
    end

    it "routes to #edit" do
      get("/webseries/1/edit").should route_to("webseries#edit", :id => "1")
    end

    it "routes to #create" do
      post("/webseries").should route_to("webseries#create")
    end

    it "routes to #update" do
      put("/webseries/1").should route_to("webseries#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/webseries/1").should route_to("webseries#destroy", :id => "1")
    end

  end
end
