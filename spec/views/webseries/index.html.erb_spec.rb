require 'spec_helper'

describe "webseries/index" do
  before(:each) do
    assign(:webseries, [
      stub_model(Webseries,
        :url => "Url",
        :string => "String",
        :metadata => "Metadata",
        :string => "String",
        :thumbimg => "Thumbimg",
        :string => "String"
      ),
      stub_model(Webseries,
        :url => "Url",
        :string => "String",
        :metadata => "Metadata",
        :string => "String",
        :thumbimg => "Thumbimg",
        :string => "String"
      )
    ])
  end

  it "renders a list of webseries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "String".to_s, :count => 2
    assert_select "tr>td", :text => "Metadata".to_s, :count => 2
    assert_select "tr>td", :text => "String".to_s, :count => 2
    assert_select "tr>td", :text => "Thumbimg".to_s, :count => 2
    assert_select "tr>td", :text => "String".to_s, :count => 2
  end
end
