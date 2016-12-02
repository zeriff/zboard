class ApplicationController < ActionController::Base
  # include CanCan::ControllerAdditions
  protect_from_forgery with: :exception
  layout :layout_by_resource
  before_action :configure_permitted_parameters, if: :devise_controller?



  # Custom authorization for ajax
  def auth_user
    if !user_signed_in?
      render json: {
        msg: "You need to sign in or sign up before continuing."
      }, status: 401
    end
  end


  def authenticate_admin
    if !current_user.is_an_admin?
      redirect_to :root
      flash[:error] = "You are not authorized"
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "You are not authorized to perform this function..!"
    redirect_to :back
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :gender, :location])
    devise_parameter_sanitizer
        .permit(:account_update,
                keys: [
                        :profession_list,
                        :intrest_list,
                        :cover,
                        :avatar,
                        :about,
                        :location
                      ]
                )
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
