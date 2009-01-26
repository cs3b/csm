require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Feature do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :what => "value for what",
      :who => "value for who",
      :why => "value for why"
    }
  end

  it "should create a new instance given valid attributes" do
    Feature.create!(@valid_attributes)
  end
end
