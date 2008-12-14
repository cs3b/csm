require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StoriesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "stories", :action => "index").should == "/stories"
    end
  
    it "should map #new" do
      route_for(:controller => "stories", :action => "new").should == "/stories/new"
    end
  
    it "should map #show" do
      route_for(:controller => "stories", :action => "show", :id => 1).should == "/stories/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "stories", :action => "edit", :id => 1).should == "/stories/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "stories", :action => "update", :id => 1).should == "/stories/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "stories", :action => "destroy", :id => 1).should == "/stories/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/stories").should == {:controller => "stories", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/stories/new").should == {:controller => "stories", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/stories").should == {:controller => "stories", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/stories/1").should == {:controller => "stories", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/stories/1/edit").should == {:controller => "stories", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/stories/1").should == {:controller => "stories", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/stories/1").should == {:controller => "stories", :action => "destroy", :id => "1"}
    end
  end
end
