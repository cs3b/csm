require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ScenariosController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "scenarios", :action => "index").should == "/scenarios"
    end
  
    it "should map #new" do
      route_for(:controller => "scenarios", :action => "new").should == "/scenarios/new"
    end
  
    it "should map #show" do
      route_for(:controller => "scenarios", :action => "show", :id => 1).should == "/scenarios/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "scenarios", :action => "edit", :id => 1).should == "/scenarios/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "scenarios", :action => "update", :id => 1).should == "/scenarios/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "scenarios", :action => "destroy", :id => 1).should == "/scenarios/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/scenarios").should == {:controller => "scenarios", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/scenarios/new").should == {:controller => "scenarios", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/scenarios").should == {:controller => "scenarios", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/scenarios/1").should == {:controller => "scenarios", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/scenarios/1/edit").should == {:controller => "scenarios", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/scenarios/1").should == {:controller => "scenarios", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/scenarios/1").should == {:controller => "scenarios", :action => "destroy", :id => "1"}
    end
  end
end
