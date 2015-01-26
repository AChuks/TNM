require 'spec_helper'

describe "trend_fashions/index" do
  before(:each) do
    assign(:trend_fashions, [
      stub_model(TrendFashion,
        :url => "Url",
        :mdata => "",
        :img => "Img"
      ),
      stub_model(TrendFashion,
        :url => "Url",
        :mdata => "",
        :img => "Img"
      )
    ])
  end

  it "renders a list of trend_fashions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Img".to_s, :count => 2
  end
end
