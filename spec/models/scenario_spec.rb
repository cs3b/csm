require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Scenario do
  before(:each) do
    @valid_attributes = {
      :content => "value for content",
      :parent_id => ,
      :position => 1,
      :type => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Scenario.create!(@valid_attributes)
  end
end
