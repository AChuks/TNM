require 'spec_helper'

describe "popular_videos/show" do
  before(:each) do
    @popular_video = assign(:popular_video, stub_model(PopularVideo,
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
