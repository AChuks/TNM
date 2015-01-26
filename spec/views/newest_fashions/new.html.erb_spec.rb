require 'spec_helper'

describe "newest_fashions/new" do
  before(:each) do
    assign(:newest_fashion, stub_model(NewestFashion,
      :url => "MyString",
      :mdata => "",
      :img => "MyString"
    ).as_new_record)
  end

  it "renders new newest_fashion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", newest_fashions_path, "post" do
      assert_select "input#newest_fashion_url[name=?]", "newest_fashion[url]"
      assert_select "input#newest_fashion_mdata[name=?]", "newest_fashion[mdata]"
      assert_select "input#newest_fashion_img[name=?]", "newest_fashion[img]"
    end
  end
end
