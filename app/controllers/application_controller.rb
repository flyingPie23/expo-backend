class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :name])
  end
end
