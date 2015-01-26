require 'spec_helper'

describe "TrendFashions" do
  describe "GET /trend_fashions" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get trend_fashions_path
      response.status.should be(200)
    end
  end
end
