require 'spec_helper'

describe "newest_fashions/edit" do
  before(:each) do
    @newest_fashion = assign(:newest_fashion, stub_model(NewestFashion,
      :url => "MyString",
      :mdata => "",
      :img => "MyString"
    ))
  end

  it "renders the edit newest_fashion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", newest_fashion_path(@newest_fashion), "post" do
      assert_select "input#newest_fashion_url[name=?]", "newest_fashion[url]"
      assert_select "input#newest_fashion_mdata[name=?]", "newest_fashion[mdata]"
      assert_select "input#newest_fashion_img[name=?]", "newest_fashion[img]"
    end
  end
end
