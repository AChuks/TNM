require 'spec_helper'

describe "talent_videos/new" do
  before(:each) do
    assign(:talent_video, stub_model(TalentVideo,
      :url => "MyString",
      :mdata => "MyString",
      :img => "MyString"
    ).as_new_record)
  end

  it "renders new talent_video form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", talent_videos_path, "post" do
      assert_select "input#talent_video_url[name=?]", "talent_video[url]"
      assert_select "input#talent_video_mdata[name=?]", "talent_video[mdata]"
      assert_select "input#talent_video_img[name=?]", "talent_video[img]"
    end
  end
end
