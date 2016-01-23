require 'spec_helper'

describe "youtubes/show" do
  before(:each) do
    @youtube = assign(:youtube, stub_model(Youtube,
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
