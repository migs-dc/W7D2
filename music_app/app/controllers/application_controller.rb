class ApplicationController < ActionController::Base #CELLL

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
      # how is session defined or accessible here. rails magic i think
  end

  def ensure_logged_in
    
  end

  def login!

  end

  def logout!

  end

  def logged_in?

  end

end
