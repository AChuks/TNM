require 'spec_helper'

describe "youtubes/new" do
  before(:each) do
    assign(:youtube, stub_model(Youtube,
      :url => "MyString",
      :title => "MyString",
      :meta_data => "MyString"
    ).as_new_record)
  end

  it "renders new youtube form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", youtubes_path, "post" do
      assert_select "input#youtube_url[name=?]", "youtube[url]"
      assert_select "input#youtube_title[name=?]", "youtube[title]"
      assert_select "input#youtube_meta_data[name=?]", "youtube[meta_data]"
    end
  end
end
