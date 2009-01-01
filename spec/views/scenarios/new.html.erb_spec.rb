require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/scenarios/new.html.erb" do
  include ScenariosHelper
  
  before(:each) do
    assigns[:scenario] = stub_model(Scenario,
      :new_record? => true,
      :content => "value for content",
      :parent_id => ,
      :position => 1,
      :type => 1
    )
  end

  it "should render new form" do
    render "/scenarios/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", scenarios_path) do
      with_tag("input#scenario_content[name=?]", "scenario[content]")
      with_tag("input#scenario_parent_id[name=?]", "scenario[parent_id]")
      with_tag("input#scenario_position[name=?]", "scenario[position]")
      with_tag("input#scenario_type[name=?]", "scenario[type]")
    end
  end
end


