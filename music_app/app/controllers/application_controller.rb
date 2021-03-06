class ApplicationController < ActionController::Base #CELLL
  helper_method :current_user, :logged_in?, :log_in_user!

  def current_user
    #return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
      # how is session defined or accessible here. rails magic i think
  end

  def ensure_logged_in #this might be require_user!
  end

  def log_in_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout!
    current_user.reset_session_token!
  end

  def logged_in?
    !!current_user
  end

end
