require 'spec_helper'

describe "webseries/new" do
  before(:each) do
    assign(:webseries, stub_model(Webseries,
      :url => "MyString",
      :string => "MyString",
      :metadata => "MyString",
      :string => "MyString",
      :thumbimg => "MyString",
      :string => "MyString"
    ).as_new_record)
  end

  it "renders new webseries form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", webseries_index_path, "post" do
      assert_select "input#webseries_url[name=?]", "webseries[url]"
      assert_select "input#webseries_string[name=?]", "webseries[string]"
      assert_select "input#webseries_metadata[name=?]", "webseries[metadata]"
      assert_select "input#webseries_string[name=?]", "webseries[string]"
      assert_select "input#webseries_thumbimg[name=?]", "webseries[thumbimg]"
      assert_select "input#webseries_string[name=?]", "webseries[string]"
    end
  end
end
