require 'spec_helper'

describe "trend_fashions/new" do
  before(:each) do
    assign(:trend_fashion, stub_model(TrendFashion,
      :url => "MyString",
      :mdata => "",
      :img => "MyString"
    ).as_new_record)
  end

  it "renders new trend_fashion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", trend_fashions_path, "post" do
      assert_select "input#trend_fashion_url[name=?]", "trend_fashion[url]"
      assert_select "input#trend_fashion_mdata[name=?]", "trend_fashion[mdata]"
      assert_select "input#trend_fashion_img[name=?]", "trend_fashion[img]"
    end
  end
end
