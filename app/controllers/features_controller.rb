class FeaturesController < ApplicationController

  before_filter :get_features, :only => [:index]
  before_filter :get_feature, :only => [:show, :edit, :update, :destroy]

  def index; end

  def show
    respond_to do |format|
      format.html
      format.feature { render :layout => false }
    end
  end
  
  def new
    @feature = Feature.new
  end

  def edit; end
  
  def create
    @feature = Feature.new(params[:feature])
    if @feature.save
      flash[:notice] = 'Feature was successfully created.'
      redirect_to(@feature)
    else
      render :action => "new"
    end
  end

  def update
    if @feature.update_attributes(params[:feature])
      flash[:notice] = 'Feature was successfully updated.'
      redirect_to(@feature)
    else
      render :action => "edit"
    end
  end

  def destroy
    @feature.destroy
    redirect_to features_url
  end

  private

  def get_features
    @features = Feature.find(:all)
  end
  
  def get_feature
    @feature = Feature.find(params[:id])
  end
  
end
