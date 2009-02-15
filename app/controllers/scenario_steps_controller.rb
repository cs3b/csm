class ScenarioStepsController < ApplicationController
  before_filter :get_step, :only => [:destroy]

  def destroy
    feature = @step.scenario.feature
    @step.destroy
    redirect_to(feature)
  end

  private
  
  def get_step
    @step = ScenarioStep.find(params[:id])
  end
end
