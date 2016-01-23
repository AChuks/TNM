require 'spec_helper'

describe "youtubes/edit" do
  before(:each) do
    @youtube = assign(:youtube, stub_model(Youtube,
      :url => "MyString",
      :title => "MyString",
      :meta_data => "MyString"
    ))
  end

  it "renders the edit youtube form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", youtube_path(@youtube), "post" do
      assert_select "input#youtube_url[name=?]", "youtube[url]"
      assert_select "input#youtube_title[name=?]", "youtube[title]"
      assert_select "input#youtube_meta_data[name=?]", "youtube[meta_data]"
    end
  end
end
