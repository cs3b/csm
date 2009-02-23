# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  
  include Clearance::App::Controllers::ApplicationController

  before_filter :set_current_user_to_thread_variable

  helper :all # include all helpers, all the time
  layout 'default'
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  #  protect_from_forgery  :secret => '46bd7f266810096aa04e4699e21111da'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password

  private
  def set_current_user_to_thread_variable
    Thread.current['current_user'] = current_user
  end
  
end
