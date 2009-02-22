class ScenariosController < ApplicationController
  before_filter :authenticate
  before_filter :get_feature, :only => [:index, :new, :create]
  before_filter :get_scenarios, :only => [:index]
  before_filter :get_scenario, :only => [:show, :update, :destroy]

  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @scenarios }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @scenario }
      format.js { render :json => @scenario }
    end
  end

  def new
    @scenario = Scenario.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @scenario }
    end
  end

  def create
#    throw params[:scenario].to_yaml
    @scenario = @feature.scenarios.build(params[:scenario].merge({:committed_by => current_user}))
    respond_to do |format|
      if @scenario.save
        flash[:notice] = 'Scenario was successfully created.'
        format.html { redirect_to(@feature) }
        format.xml  { render :xml => @scenario, :status => :created, :location => @scenario }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @scenario.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @scenario.update_attributes(params[:scenario].merge({:committed_by => current_user}))
        flash[:notice] = 'Scenario was successfully updated.'
        format.html { redirect_to(@scenario) }
        format.xml  { head :ok }
        format.js  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @scenario.errors, :status => :unprocessable_entity }
        format.js  { render :json => @scenario.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @scenario.committed_by = current_user
    @scenario.destroy
    redirect_to feature_path(@scenario.feature_id)
  end

  private
  def get_feature
    @feature = Feature.find(params[:feature_id])
  end
  def get_scenarios
    @scenarios = @feature.scenarios.all
  end
  def get_scenario
    @scenario = Scenario.find(params[:id])
  end
end
