class StoriesController < ApplicationController

  before_filter :get_feature
  before_filter :get_stories, :only => [:index]
  before_filter :get_story, :only => [:show, :edit, :update, :destroy]
  
  def index;  end

  def show; end

  def new
    @story = Story.new
  end

  def edit; end

  def create
    @story = Story.new(params[:story])
    if @story.save
      flash[:notice] = 'Story was successfully created.'
      redirect_to feature_story_path(@feature, @story)
    else
      flash[:notice] = 'Story was not successfully created.'
      render :action => :edit
    end
  end

  def update
    if @story.update_attributes(params[:story])
      flash[:notice] = 'Story was successfully updated.'
    else
      flash[:notice] = 'Story was not successfully updated.'
    end
  end

  def destroy
    @story.destroy
    redirect_to feature_stories_path
  end

  private

  def get_feature
    @feature = Feature.find(params[:feature_id])
  end

  def get_story
    @story = Story.find(params[:id])
  end

  def get_stories
    @stories = Story.all
  end
end
