class ScenarioStepsController < ApplicationController
  before_filter :get_scenario, :only => [:new, :create]
  before_filter :get_step, :only => [:destroy]
  def new
    @step = ScenarioStep.new
  end
  def create
    @step = @scenario.steps.build(params[:scenario_step])
    @step.save
    redirect_to(@scenario.feature)
  end
  def destroy
    feature = @step.scenario.feature
    @step.destroy
    redirect_to(feature)
  end

  private
  
  def get_scenario
    @scenario = Scenario.find(params[:scenario_id])
  end
  def get_step
    @step = ScenarioStep.find(params[:id])
  end
end
