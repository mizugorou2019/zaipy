class UsersController < ApplicationController
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:log_in, keys: [:name, :password])
  end

end
