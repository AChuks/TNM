require 'spec_helper'

describe "trendings/show" do
  before(:each) do
    @trending = assign(:trending, stub_model(Trending,
      :url => "Url",
      :title => "Title",
      :meta_data => "Meta Data"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
    rendered.should match(/Title/)
    rendered.should match(/Meta Data/)
  end
end
