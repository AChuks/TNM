require 'spec_helper'

describe "newest_videos/edit" do
  before(:each) do
    @newest_video = assign(:newest_video, stub_model(NewestVideo,
      :url => "MyString",
      :mdata => "MyString",
      :img => "MyString"
    ))
  end

  it "renders the edit newest_video form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", newest_video_path(@newest_video), "post" do
      assert_select "input#newest_video_url[name=?]", "newest_video[url]"
      assert_select "input#newest_video_mdata[name=?]", "newest_video[mdata]"
      assert_select "input#newest_video_img[name=?]", "newest_video[img]"
    end
  end
end
