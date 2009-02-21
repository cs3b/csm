class ScenarioStepsController < ApplicationController
  before_filter :authenticate
  before_filter :get_step, :only => [:destroy, :update, :show]

  def destroy
    feature = @step.scenario.feature
    @step.destroy
    redirect_to(feature)
  end

  def update
    @step.update_attributes(params[:scenario_step])
    render :nothing => true, :status => :ok
  end

  def show
    respond_to do |type|
      type.js {render :json => @step}
    end
  end

  private
  
  def get_step
    @step = ScenarioStep.find(params[:id])
  end
end
