require 'spec_helper'

describe "musics/show" do
  before(:each) do
    @music = assign(:music, stub_model(Music,
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
