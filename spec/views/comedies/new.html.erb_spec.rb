require 'spec_helper'

describe "comedies/new" do
  before(:each) do
    assign(:comedy, stub_model(Comedy,
      :url => "MyString",
      :mdata => "",
      :img => "MyString"
    ).as_new_record)
  end

  it "renders new comedy form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", comedies_path, "post" do
      assert_select "input#comedy_url[name=?]", "comedy[url]"
      assert_select "input#comedy_mdata[name=?]", "comedy[mdata]"
      assert_select "input#comedy_img[name=?]", "comedy[img]"
    end
  end
end
