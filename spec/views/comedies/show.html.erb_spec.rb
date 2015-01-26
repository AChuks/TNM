require 'spec_helper'

describe "comedies/show" do
  before(:each) do
    @comedy = assign(:comedy, stub_model(Comedy,
      :url => "Url",
      :mdata => "",
      :img => "Img"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
    rendered.should match(//)
    rendered.should match(/Img/)
  end
end
