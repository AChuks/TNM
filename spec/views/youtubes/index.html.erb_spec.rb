require 'spec_helper'

describe "youtubes/index" do
  before(:each) do
    assign(:youtubes, [
      stub_model(Youtube,
        :url => "Url",
        :title => "Title",
        :meta_data => "Meta Data"
      ),
      stub_model(Youtube,
        :url => "Url",
        :title => "Title",
        :meta_data => "Meta Data"
      )
    ])
  end

  it "renders a list of youtubes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Meta Data".to_s, :count => 2
  end
end
