require 'spec_helper'

describe "trend_videos/show" do
  before(:each) do
    @trend_video = assign(:trend_video, stub_model(TrendVideo,
      :url => "Url",
      :mdata => "Mdata",
      :img => "Img"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
    rendered.should match(/Mdata/)
    rendered.should match(/Img/)
  end
end
