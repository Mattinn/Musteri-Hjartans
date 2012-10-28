class ApplicationController < ActionController::Base
  protect_from_forgery
  force_ssl
  helper_method :current_user

end
