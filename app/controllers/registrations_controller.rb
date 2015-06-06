class RegistrationsController < Devise::RegistrationsController
  before_action :set_sign_up_parameters, only: [:create]

  private

  def set_sign_up_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end
