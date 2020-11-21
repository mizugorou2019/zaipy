class UsersController < ApplicationController
  has_secure_password
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:log_in, keys: [:name, :password])
  end
end
