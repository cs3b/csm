require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FeaturesController do

  def mock_feature(stubs={})
    @mock_feature ||= mock_model(Feature, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all features as @features" do
      Feature.should_receive(:find).with(:all).and_return([mock_feature])
      get :index
      assigns[:features].should == [mock_feature]
    end

    describe "with mime type of xml" do
  
      it "should render all features as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Feature.should_receive(:find).with(:all).and_return(features = mock("Array of Features"))
        features.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested feature as @feature" do
      Feature.should_receive(:find).with("37").and_return(mock_feature)
      get :show, :id => "37"
      assigns[:feature].should equal(mock_feature)
    end
    
    describe "with mime type of xml" do

      it "should render the requested feature as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Feature.should_receive(:find).with("37").and_return(mock_feature)
        mock_feature.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new feature as @feature" do
      Feature.should_receive(:new).and_return(mock_feature)
      get :new
      assigns[:feature].should equal(mock_feature)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested feature as @feature" do
      Feature.should_receive(:find).with("37").and_return(mock_feature)
      get :edit, :id => "37"
      assigns[:feature].should equal(mock_feature)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created feature as @feature" do
        Feature.should_receive(:new).with({'these' => 'params'}).and_return(mock_feature(:save => true))
        post :create, :feature => {:these => 'params'}
        assigns(:feature).should equal(mock_feature)
      end

      it "should redirect to the created feature" do
        Feature.stub!(:new).and_return(mock_feature(:save => true))
        post :create, :feature => {}
        response.should redirect_to(feature_url(mock_feature))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved feature as @feature" do
        Feature.stub!(:new).with({'these' => 'params'}).and_return(mock_feature(:save => false))
        post :create, :feature => {:these => 'params'}
        assigns(:feature).should equal(mock_feature)
      end

      it "should re-render the 'new' template" do
        Feature.stub!(:new).and_return(mock_feature(:save => false))
        post :create, :feature => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested feature" do
        Feature.should_receive(:find).with("37").and_return(mock_feature)
        mock_feature.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :feature => {:these => 'params'}
      end

      it "should expose the requested feature as @feature" do
        Feature.stub!(:find).and_return(mock_feature(:update_attributes => true))
        put :update, :id => "1"
        assigns(:feature).should equal(mock_feature)
      end

      it "should redirect to the feature" do
        Feature.stub!(:find).and_return(mock_feature(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(feature_url(mock_feature))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested feature" do
        Feature.should_receive(:find).with("37").and_return(mock_feature)
        mock_feature.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :feature => {:these => 'params'}
      end

      it "should expose the feature as @feature" do
        Feature.stub!(:find).and_return(mock_feature(:update_attributes => false))
        put :update, :id => "1"
        assigns(:feature).should equal(mock_feature)
      end

      it "should re-render the 'edit' template" do
        Feature.stub!(:find).and_return(mock_feature(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested feature" do
      Feature.should_receive(:find).with("37").and_return(mock_feature)
      mock_feature.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the features list" do
      Feature.stub!(:find).and_return(mock_feature(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(features_url)
    end

  end

end
