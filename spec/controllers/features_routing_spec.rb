require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FeaturesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "features", :action => "index").should == "/features"
    end
  
    it "should map #new" do
      route_for(:controller => "features", :action => "new").should == "/features/new"
    end
  
    it "should map #show" do
      route_for(:controller => "features", :action => "show", :id => 1).should == "/features/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "features", :action => "edit", :id => 1).should == "/features/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "features", :action => "update", :id => 1).should == "/features/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "features", :action => "destroy", :id => 1).should == "/features/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/features").should == {:controller => "features", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/features/new").should == {:controller => "features", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/features").should == {:controller => "features", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/features/1").should == {:controller => "features", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/features/1/edit").should == {:controller => "features", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/features/1").should == {:controller => "features", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/features/1").should == {:controller => "features", :action => "destroy", :id => "1"}
    end
  end
end
