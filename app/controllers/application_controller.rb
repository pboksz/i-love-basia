class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  helper_method :locale
  def locale
    params[:locale]
  end

  def after_login_path(new_locale = locale)
    admin_guests_path(new_locale)
  end

  def after_logout_path(new_locale = locale)
    root_path(new_locale)
  end

  private

  def set_locale
    I18n.locale = locale || I18n.default_locale
  end
end
