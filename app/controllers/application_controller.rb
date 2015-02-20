class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  def after_login_path(locale = nil)
    admin_guests_path
  end

  def after_logout_path(locale = nil)
    root_path
  end

  private

  def set_locale
    I18n.locale = locale || I18n.default_locale
  end
end
