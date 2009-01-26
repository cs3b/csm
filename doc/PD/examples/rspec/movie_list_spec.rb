require 'spec'
require 'movie'
require 'movie_list'

describe MovieList do
  context "empty movie list" do
    before(:all) do
      @list = MovieList.new
    end
    it "should have size of 0" do
      @list.size.should == 0
    end
    it "should not include 'Star Wars'" do
      @list.should_not include('Star Wars')
    end
  end
  context "'Star Wars' item on movie list" do
    before(:all) do
      @list = MovieList.new
      star_wars = Movie.new "Star Wars"
      @list.add star_wars
    end
    it "should have size of 1" do
      @list.size.should == 1
    end
    it "should include 'Star Wars'" do
      @list.should include("Star Wars")
    end
  end
end