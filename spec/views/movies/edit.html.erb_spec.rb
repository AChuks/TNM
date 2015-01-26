require 'spec_helper'

describe "movies/edit" do
  before(:each) do
    @movie = assign(:movie, stub_model(Movie,
      :url => "MyString",
      :mdata => "",
      :img => "MyString"
    ))
  end

  it "renders the edit movie form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", movie_path(@movie), "post" do
      assert_select "input#movie_url[name=?]", "movie[url]"
      assert_select "input#movie_mdata[name=?]", "movie[mdata]"
      assert_select "input#movie_img[name=?]", "movie[img]"
    end
  end
end
