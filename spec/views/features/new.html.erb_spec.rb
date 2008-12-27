require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/features/new.html.erb" do
  include FeaturesHelper
  
  before(:each) do
    assigns[:feature] = stub_model(Feature,
      :new_record? => true,
      :title => "value for title",
      :in_order_to => "value for in_order_to"
    )
  end

  it "should render new form" do
    render "/features/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", features_path) do
      with_tag("input#feature_title[name=?]", "feature[title]")
      with_tag("textarea#feature_in_order_to[name=?]", "feature[in_order_to]")
    end
  end
end


