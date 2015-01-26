require 'spec_helper'

describe "newest_fashions/show" do
  before(:each) do
    @newest_fashion = assign(:newest_fashion, stub_model(NewestFashion,
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
