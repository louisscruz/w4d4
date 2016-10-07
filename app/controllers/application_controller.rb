class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def login(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout(user)
    user.reset_session_token!
    session[:session_token] = nil
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in_only
    unless current_user
      redirect_to new_user_url
    end
  end

  def is_admin?
    current_user && current_user.admin
  end

  def admin_only
    unless is_admin?
      redirect_to root_url
    end
  end
end
