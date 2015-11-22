require 'spec_helper'

describe "videos/index" do
  before(:each) do
    assign(:videos, [
      stub_model(Video,
        :url => "Url",
        :mdata => "Mdata",
        :img => "Img"
      ),
      stub_model(Video,
        :url => "Url",
        :mdata => "Mdata",
        :img => "Img"
      )
    ])
  end

  it "renders a list of videos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Mdata".to_s, :count => 2
    assert_select "tr>td", :text => "Img".to_s, :count => 2
  end
end
