require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StoriesController do

  def mock_story(stubs={})
    @mock_story ||= mock_model(Story, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all stories as @stories" do
      Story.should_receive(:find).with(:all).and_return([mock_story])
      get :index
      assigns[:stories].should == [mock_story]
    end

    describe "with mime type of xml" do
  
      it "should render all stories as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Story.should_receive(:find).with(:all).and_return(stories = mock("Array of Stories"))
        stories.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested story as @story" do
      Story.should_receive(:find).with("37").and_return(mock_story)
      get :show, :id => "37"
      assigns[:story].should equal(mock_story)
    end
    
    describe "with mime type of xml" do

      it "should render the requested story as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Story.should_receive(:find).with("37").and_return(mock_story)
        mock_story.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new story as @story" do
      Story.should_receive(:new).and_return(mock_story)
      get :new
      assigns[:story].should equal(mock_story)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested story as @story" do
      Story.should_receive(:find).with("37").and_return(mock_story)
      get :edit, :id => "37"
      assigns[:story].should equal(mock_story)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created story as @story" do
        Story.should_receive(:new).with({'these' => 'params'}).and_return(mock_story(:save => true))
        post :create, :story => {:these => 'params'}
        assigns(:story).should equal(mock_story)
      end

      it "should redirect to the created story" do
        Story.stub!(:new).and_return(mock_story(:save => true))
        post :create, :story => {}
        response.should redirect_to(story_url(mock_story))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved story as @story" do
        Story.stub!(:new).with({'these' => 'params'}).and_return(mock_story(:save => false))
        post :create, :story => {:these => 'params'}
        assigns(:story).should equal(mock_story)
      end

      it "should re-render the 'new' template" do
        Story.stub!(:new).and_return(mock_story(:save => false))
        post :create, :story => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested story" do
        Story.should_receive(:find).with("37").and_return(mock_story)
        mock_story.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :story => {:these => 'params'}
      end

      it "should expose the requested story as @story" do
        Story.stub!(:find).and_return(mock_story(:update_attributes => true))
        put :update, :id => "1"
        assigns(:story).should equal(mock_story)
      end

      it "should redirect to the story" do
        Story.stub!(:find).and_return(mock_story(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(story_url(mock_story))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested story" do
        Story.should_receive(:find).with("37").and_return(mock_story)
        mock_story.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :story => {:these => 'params'}
      end

      it "should expose the story as @story" do
        Story.stub!(:find).and_return(mock_story(:update_attributes => false))
        put :update, :id => "1"
        assigns(:story).should equal(mock_story)
      end

      it "should re-render the 'edit' template" do
        Story.stub!(:find).and_return(mock_story(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested story" do
      Story.should_receive(:find).with("37").and_return(mock_story)
      mock_story.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the stories list" do
      Story.stub!(:find).and_return(mock_story(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(stories_url)
    end

  end

end
