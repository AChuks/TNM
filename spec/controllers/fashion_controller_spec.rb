require 'spec_helper'

describe FashionController do

  describe "GET 'newest'" do
    it "returns http success" do
      get 'newest'
      response.should be_success
    end
  end

  describe "GET 'most_viewed'" do
    it "returns http success" do
      get 'most_viewed'
      response.should be_success
    end
  end

  describe "GET 'upload'" do
    it "returns http success" do
      get 'upload'
      response.should be_success
    end
  end

end
