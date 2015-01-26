require 'spec_helper'

describe "musics/edit" do
  before(:each) do
    @music = assign(:music, stub_model(Music,
      :url => "MyString",
      :mdata => "",
      :img => "MyString"
    ))
  end

  it "renders the edit music form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", music_path(@music), "post" do
      assert_select "input#music_url[name=?]", "music[url]"
      assert_select "input#music_mdata[name=?]", "music[mdata]"
      assert_select "input#music_img[name=?]", "music[img]"
    end
  end
end
