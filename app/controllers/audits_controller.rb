class AuditsController < ApplicationController
  before_filter :authenticate
  def index
    @changes = Audit.all :conditions => Audit.prepare_conditions(params[:object_type], params[:object_id])
  end  
end
