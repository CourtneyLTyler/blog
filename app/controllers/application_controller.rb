class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  rescue_from CanCan::AccessDenied do |exception|
    # Rails.logger.debug "Access Denied: #{exception.message}"
    redirect_to main_app.root_url, alert: exception.message
  end

end
