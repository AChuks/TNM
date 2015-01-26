require 'spec_helper'

describe "musics/index" do
  before(:each) do
    assign(:musics, [
      stub_model(Music,
        :url => "Url",
        :mdata => "",
        :img => "Img"
      ),
      stub_model(Music,
        :url => "Url",
        :mdata => "",
        :img => "Img"
      )
    ])
  end

  it "renders a list of musics" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Img".to_s, :count => 2
  end
end
