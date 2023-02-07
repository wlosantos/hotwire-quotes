class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def current_company
    @current_company ||= current_user.company if user_signed_in?
  end
  helper_method :current_company

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:company_id])
  end
end
