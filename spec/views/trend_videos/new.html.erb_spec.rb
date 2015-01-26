require 'spec_helper'

describe "trend_videos/new" do
  before(:each) do
    assign(:trend_video, stub_model(TrendVideo,
      :url => "MyString",
      :mdata => "MyString",
      :img => "MyString"
    ).as_new_record)
  end

  it "renders new trend_video form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", trend_videos_path, "post" do
      assert_select "input#trend_video_url[name=?]", "trend_video[url]"
      assert_select "input#trend_video_mdata[name=?]", "trend_video[mdata]"
      assert_select "input#trend_video_img[name=?]", "trend_video[img]"
    end
  end
end
