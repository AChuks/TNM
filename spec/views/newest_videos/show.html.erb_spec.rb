require 'spec_helper'

describe "newest_videos/show" do
  before(:each) do
    @newest_video = assign(:newest_video, stub_model(NewestVideo,
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
