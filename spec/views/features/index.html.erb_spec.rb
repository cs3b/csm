require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/features/index.html.erb" do
  include FeaturesHelper
  
  before(:each) do
    assigns[:features] = [
      stub_model(Feature,
        :title => "value for title",
        :in_order_to => "value for in_order_to"
      ),
      stub_model(Feature,
        :title => "value for title",
        :in_order_to => "value for in_order_to"
      )
    ]
  end

  it "should render list of features" do
    render "/features/index.html.erb"
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for in_order_to".to_s, 2)
  end
end

