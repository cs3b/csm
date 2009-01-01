require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/scenarios/index.html.erb" do
  include ScenariosHelper
  
  before(:each) do
    assigns[:scenarios] = [
      stub_model(Scenario,
        :content => "value for content",
        :parent_id => ,
        :position => 1,
        :type => 1
      ),
      stub_model(Scenario,
        :content => "value for content",
        :parent_id => ,
        :position => 1,
        :type => 1
      )
    ]
  end

  it "should render list of scenarios" do
    render "/scenarios/index.html.erb"
    response.should have_tag("tr>td", "value for content".to_s, 2)
    response.should have_tag("tr>td", .to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

