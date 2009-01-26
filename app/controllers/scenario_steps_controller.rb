class ScenarioStepsController < ApplicationController
  before_filter :get_scenario
  def new
    @step = ScenarioStep.new
  end
  def create
    @step = @scenario.steps.build(params[:scenario_step])
    @step.save
    redirect_to(@scenario.feature)
  end
  private
  def get_scenario
    @scenario = Scenario.find(params[:scenario_id])
  end
end
