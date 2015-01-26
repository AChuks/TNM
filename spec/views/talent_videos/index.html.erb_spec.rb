require 'spec_helper'

describe "talent_videos/index" do
  before(:each) do
    assign(:talent_videos, [
      stub_model(TalentVideo,
        :url => "Url",
        :mdata => "Mdata",
        :img => "Img"
      ),
      stub_model(TalentVideo,
        :url => "Url",
        :mdata => "Mdata",
        :img => "Img"
      )
    ])
  end

  it "renders a list of talent_videos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Mdata".to_s, :count => 2
    assert_select "tr>td", :text => "Img".to_s, :count => 2
  end
end
