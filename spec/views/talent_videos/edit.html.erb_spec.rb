require 'spec_helper'

describe "talent_videos/edit" do
  before(:each) do
    @talent_video = assign(:talent_video, stub_model(TalentVideo,
      :url => "MyString",
      :mdata => "MyString",
      :img => "MyString"
    ))
  end

  it "renders the edit talent_video form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", talent_video_path(@talent_video), "post" do
      assert_select "input#talent_video_url[name=?]", "talent_video[url]"
      assert_select "input#talent_video_mdata[name=?]", "talent_video[mdata]"
      assert_select "input#talent_video_img[name=?]", "talent_video[img]"
    end
  end
end
