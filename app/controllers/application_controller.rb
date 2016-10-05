class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout_by_resource
  before_filter :configure_permitted_parameters, if: :devise_controller?



  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  def layout_by_resource
    if devise_controller?
      "session"
    else
      "application"
    end
  end
end
