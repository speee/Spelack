class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) << :nickname
  # end
end
