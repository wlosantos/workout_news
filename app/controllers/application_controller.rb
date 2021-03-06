class ApplicationController < ActionController::Base

  before_action :set_locale

  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :layout_by_resource

  def set_locale
    I18n.locale = 'pt-BR'
  end

  private

  def layout_by_resource
    "authentication" if devise_controller? || (params[:controller] == 'users' && params[:action] != 'show' && params[:profile])
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: %i[ name username kind status ]
    devise_parameter_sanitizer.permit :account_update, keys: %i[ name avatar ]
  end

end
