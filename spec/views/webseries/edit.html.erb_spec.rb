require 'spec_helper'

describe "webseries/edit" do
  before(:each) do
    @webseries = assign(:webseries, stub_model(Webseries,
      :url => "MyString",
      :string => "MyString",
      :metadata => "MyString",
      :string => "MyString",
      :thumbimg => "MyString",
      :string => "MyString"
    ))
  end

  it "renders the edit webseries form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", webseries_path(@webseries), "post" do
      assert_select "input#webseries_url[name=?]", "webseries[url]"
      assert_select "input#webseries_string[name=?]", "webseries[string]"
      assert_select "input#webseries_metadata[name=?]", "webseries[metadata]"
      assert_select "input#webseries_string[name=?]", "webseries[string]"
      assert_select "input#webseries_thumbimg[name=?]", "webseries[thumbimg]"
      assert_select "input#webseries_string[name=?]", "webseries[string]"
    end
  end
end
