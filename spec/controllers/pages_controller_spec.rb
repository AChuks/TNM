require 'spec_helper'

describe PagesController do

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end
  end

  describe "GET 'videos'" do
    it "returns http success" do
      get 'videos'
      response.should be_success
    end
  end
end
