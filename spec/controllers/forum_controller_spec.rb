require 'spec_helper'

describe ForumController do

  describe "GET 'top_stories'" do
    it "returns http success" do
      get 'top_stories'
      response.should be_success
    end
  end

end
