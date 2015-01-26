require 'spec_helper'

describe "talent_videos/show" do
  before(:each) do
    @talent_video = assign(:talent_video, stub_model(TalentVideo,
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
