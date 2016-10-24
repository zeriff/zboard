class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout_by_resource
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def authenticate_admin
    if !current_user.is_an_admin?
      redirect_to :root
      flash[:error] = "You are not authorized"
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :gender, :location])
    devise_parameter_sanitizer.permit(:account_update, keys: [:cover, :gender, :avatar, :about, :insta_handler, :youtube_handler, :vine_handler, :soundcloud_handler, :location])
  end

  def layout_by_resource
    if devise_controller?
      "session"
    else
        if current_user && current_user.is_an_admin?
          "admin"
        else
          "application"
        end
    end
  end
end
