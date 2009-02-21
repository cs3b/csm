class AuditsController < ApplicationController
  def index
    @changes = Audit.all :conditions => Audit.prepare_conditions(params[:object_type], params[:object_id])
  end  
end
