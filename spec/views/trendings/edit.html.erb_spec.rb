require 'spec_helper'

describe "trendings/edit" do
  before(:each) do
    @trending = assign(:trending, stub_model(Trending,
      :url => "MyString",
      :title => "MyString",
      :meta_data => "MyString"
    ))
  end

  it "renders the edit trending form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", trending_path(@trending), "post" do
      assert_select "input#trending_url[name=?]", "trending[url]"
      assert_select "input#trending_title[name=?]", "trending[title]"
      assert_select "input#trending_meta_data[name=?]", "trending[meta_data]"
    end
  end
end
