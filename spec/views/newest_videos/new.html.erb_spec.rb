require 'spec_helper'

describe "newest_videos/new" do
  before(:each) do
    assign(:newest_video, stub_model(NewestVideo,
      :url => "MyString",
      :mdata => "MyString",
      :img => "MyString"
    ).as_new_record)
  end

  it "renders new newest_video form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", newest_videos_path, "post" do
      assert_select "input#newest_video_url[name=?]", "newest_video[url]"
      assert_select "input#newest_video_mdata[name=?]", "newest_video[mdata]"
      assert_select "input#newest_video_img[name=?]", "newest_video[img]"
    end
  end
end
