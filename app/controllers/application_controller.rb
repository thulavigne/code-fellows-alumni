class ApplicationController < ActionController::Base

  before_filter :set_locale, :httpauth
  protect_from_forgery

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def after_sign_up_path_for(resource)
    user_path(resource)
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

private

  def set_locale
    if params[:locale].present?
        I18n.locale = params[:locale]
    else
      if current_user && current_user.preferred_language_abbreviation.present?
        I18n.locale = current_user.preferred_language_abbreviation
      else
        I18n.locale = I18n.default_locale
      end
    end
    # current_user.locale
    # request.subdomain
    # request.env["HTTP_ACCEPT_LANGUAGE"]
    # request.remote_ip
  end

  def default_url_options(options = {})
    {locale: I18n.locale}
  end

  def httpauth
    unless Rails.env.development? || Rails.env.test?
      authenticate_or_request_with_http_basic do |user_name, password|
        user_name == ENV["CODEFELLOWS_PREVIEW_USERNAME"] && password == ENV["CODEFELLOWS_PREVIEW_PASSWORD"]
      end
    end
  end
end
