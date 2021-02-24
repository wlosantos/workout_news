class ApplicationController < ActionController::Base

  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :layout_by_resource

  private

  def layout_by_resource
    "authentication" if devise_controller?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: %i[ name username kind status ]
    devise_parameter_sanitizer.permit :account_update, keys: %i[ name ]
  end

end
