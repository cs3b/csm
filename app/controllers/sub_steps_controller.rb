class SubStepsController < ApplicationController
  before_filter :get_scenario_sub_step

  def new
    @sub_step = ScenarioStep.new
  end

  def create
    @sub_step = @scenario_step.children.build(params[:scenario_step])
    @sub_step.save
    redirect_to(@scenario_step.scenario.feature)
  end

  private

  def get_scenario_sub_step
    @scenario_step = ScenarioStep.find(params[:scenario_step_id])
  end
end
