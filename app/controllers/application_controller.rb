# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  private

  def authenticate_user!
    return if current_user

    cookies[:return_to] = request.fullpath
    redirect_to login_path, alert: 'Введите Ваш пароль и почту'
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
