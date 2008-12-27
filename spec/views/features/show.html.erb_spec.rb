require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/features/show.html.erb" do
  include FeaturesHelper
  before(:each) do
    assigns[:feature] = @feature = stub_model(Feature,
      :title => "value for title",
      :in_order_to => "value for in_order_to"
    )
  end

  it "should render attributes in <p>" do
    render "/features/show.html.erb"
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ in_order_to/)
  end
end

