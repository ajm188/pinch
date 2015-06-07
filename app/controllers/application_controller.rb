class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  skip_before_action :verify_authenticity_token, if: :json_request?

  def after_sign_in_path_for(resource)
    events_path
  end

  def after_sign_up_path_for(resource)
    events_path
  end

  protected

  def json_request?
    request.format.json?
  end
end
