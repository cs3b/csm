require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/scenarios/edit.html.erb" do
  include ScenariosHelper
  
  before(:each) do
    assigns[:scenario] = @scenario = stub_model(Scenario,
      :new_record? => false,
      :content => "value for content",
      :parent_id => ,
      :position => 1,
      :type => 1
    )
  end

  it "should render edit form" do
    render "/scenarios/edit.html.erb"
    
    response.should have_tag("form[action=#{scenario_path(@scenario)}][method=post]") do
      with_tag('input#scenario_content[name=?]', "scenario[content]")
      with_tag('input#scenario_parent_id[name=?]', "scenario[parent_id]")
      with_tag('input#scenario_position[name=?]', "scenario[position]")
      with_tag('input#scenario_type[name=?]', "scenario[type]")
    end
  end
end


