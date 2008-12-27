require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/features/edit.html.erb" do
  include FeaturesHelper
  
  before(:each) do
    assigns[:feature] = @feature = stub_model(Feature,
      :new_record? => false,
      :title => "value for title",
      :in_order_to => "value for in_order_to"
    )
  end

  it "should render edit form" do
    render "/features/edit.html.erb"
    
    response.should have_tag("form[action=#{feature_path(@feature)}][method=post]") do
      with_tag('input#feature_title[name=?]', "feature[title]")
      with_tag('textarea#feature_in_order_to[name=?]', "feature[in_order_to]")
    end
  end
end


