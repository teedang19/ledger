class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to '/', :alert => "You are not authorized to access this page."
  end

  private

    def after_sign_in_path_for(resource)
      resource.admin? ? rails_admin_path : accounts_path
    end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name]
    end

end
