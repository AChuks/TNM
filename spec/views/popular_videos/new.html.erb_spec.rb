require 'spec_helper'

describe "popular_videos/new" do
  before(:each) do
    assign(:popular_video, stub_model(PopularVideo,
      :url => "MyString",
      :mdata => "MyString",
      :img => "MyString"
    ).as_new_record)
  end

  it "renders new popular_video form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", popular_videos_path, "post" do
      assert_select "input#popular_video_url[name=?]", "popular_video[url]"
      assert_select "input#popular_video_mdata[name=?]", "popular_video[mdata]"
      assert_select "input#popular_video_img[name=?]", "popular_video[img]"
    end
  end
end
