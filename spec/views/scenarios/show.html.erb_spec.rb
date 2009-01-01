require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/scenarios/show.html.erb" do
  include ScenariosHelper
  before(:each) do
    assigns[:scenario] = @scenario = stub_model(Scenario,
      :content => "value for content",
      :parent_id => ,
      :position => 1,
      :type => 1
    )
  end

  it "should render attributes in <p>" do
    render "/scenarios/show.html.erb"
    response.should have_text(/value\ for\ content/)
    response.should have_text(//)
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end

