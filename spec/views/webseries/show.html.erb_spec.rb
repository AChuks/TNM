require 'spec_helper'

describe "webseries/show" do
  before(:each) do
    @webseries = assign(:webseries, stub_model(Webseries,
      :url => "Url",
      :string => "String",
      :metadata => "Metadata",
      :string => "String",
      :thumbimg => "Thumbimg",
      :string => "String"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
    rendered.should match(/String/)
    rendered.should match(/Metadata/)
    rendered.should match(/String/)
    rendered.should match(/Thumbimg/)
    rendered.should match(/String/)
  end
end
