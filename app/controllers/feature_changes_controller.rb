class FeatureChangesController < ApplicationController
  def show
    @feature = Feature.find(params[:id])
    @changes = @feature.small_changes
  end  
end
