class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if:  :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :birth_date, :gender])
    devise_parameter_sanitizer.permit(:edit, keys: [:name, :avatar, :bio, :hobbies, :birth_date, :gender])
  end
end

