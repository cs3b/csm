require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/stories/index.html.erb" do
  include StoriesHelper
  
  before(:each) do
    assigns[:stories] = [
      stub_model(Story,
        :title => "value for title",
        :description => "value for description"
      ),
      stub_model(Story,
        :title => "value for title",
        :description => "value for description"
      )
    ]
  end

  it "should render list of stories" do
    render "/stories/index.html.erb"
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
  end
end

