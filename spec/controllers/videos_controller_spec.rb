require 'spec_helper'

describe VideosController do

  describe "GET 'watch'" do
    it "returns http success" do
      get 'watch'
      response.should be_success
    end
  end

end
