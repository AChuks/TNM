require 'spec_helper'

describe "trend_videos/edit" do
  before(:each) do
    @trend_video = assign(:trend_video, stub_model(TrendVideo,
      :url => "MyString",
      :mdata => "MyString",
      :img => "MyString"
    ))
  end

  it "renders the edit trend_video form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", trend_video_path(@trend_video), "post" do
      assert_select "input#trend_video_url[name=?]", "trend_video[url]"
      assert_select "input#trend_video_mdata[name=?]", "trend_video[mdata]"
      assert_select "input#trend_video_img[name=?]", "trend_video[img]"
    end
  end
end
