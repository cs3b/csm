require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ScenariosController do

  def mock_scenario(stubs={})
    @mock_scenario ||= mock_model(Scenario, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all scenarios as @scenarios" do
      Scenario.should_receive(:find).with(:all).and_return([mock_scenario])
      get :index
      assigns[:scenarios].should == [mock_scenario]
    end

    describe "with mime type of xml" do
  
      it "should render all scenarios as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Scenario.should_receive(:find).with(:all).and_return(scenarios = mock("Array of Scenarios"))
        scenarios.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested scenario as @scenario" do
      Scenario.should_receive(:find).with("37").and_return(mock_scenario)
      get :show, :id => "37"
      assigns[:scenario].should equal(mock_scenario)
    end
    
    describe "with mime type of xml" do

      it "should render the requested scenario as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Scenario.should_receive(:find).with("37").and_return(mock_scenario)
        mock_scenario.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new scenario as @scenario" do
      Scenario.should_receive(:new).and_return(mock_scenario)
      get :new
      assigns[:scenario].should equal(mock_scenario)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested scenario as @scenario" do
      Scenario.should_receive(:find).with("37").and_return(mock_scenario)
      get :edit, :id => "37"
      assigns[:scenario].should equal(mock_scenario)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created scenario as @scenario" do
        Scenario.should_receive(:new).with({'these' => 'params'}).and_return(mock_scenario(:save => true))
        post :create, :scenario => {:these => 'params'}
        assigns(:scenario).should equal(mock_scenario)
      end

      it "should redirect to the created scenario" do
        Scenario.stub!(:new).and_return(mock_scenario(:save => true))
        post :create, :scenario => {}
        response.should redirect_to(scenario_url(mock_scenario))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved scenario as @scenario" do
        Scenario.stub!(:new).with({'these' => 'params'}).and_return(mock_scenario(:save => false))
        post :create, :scenario => {:these => 'params'}
        assigns(:scenario).should equal(mock_scenario)
      end

      it "should re-render the 'new' template" do
        Scenario.stub!(:new).and_return(mock_scenario(:save => false))
        post :create, :scenario => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested scenario" do
        Scenario.should_receive(:find).with("37").and_return(mock_scenario)
        mock_scenario.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :scenario => {:these => 'params'}
      end

      it "should expose the requested scenario as @scenario" do
        Scenario.stub!(:find).and_return(mock_scenario(:update_attributes => true))
        put :update, :id => "1"
        assigns(:scenario).should equal(mock_scenario)
      end

      it "should redirect to the scenario" do
        Scenario.stub!(:find).and_return(mock_scenario(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(scenario_url(mock_scenario))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested scenario" do
        Scenario.should_receive(:find).with("37").and_return(mock_scenario)
        mock_scenario.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :scenario => {:these => 'params'}
      end

      it "should expose the scenario as @scenario" do
        Scenario.stub!(:find).and_return(mock_scenario(:update_attributes => false))
        put :update, :id => "1"
        assigns(:scenario).should equal(mock_scenario)
      end

      it "should re-render the 'edit' template" do
        Scenario.stub!(:find).and_return(mock_scenario(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested scenario" do
      Scenario.should_receive(:find).with("37").and_return(mock_scenario)
      mock_scenario.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the scenarios list" do
      Scenario.stub!(:find).and_return(mock_scenario(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(scenarios_url)
    end

  end

end
