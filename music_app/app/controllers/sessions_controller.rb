class SessionsController < ApplicationController 

  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    #should reset the appropriate user's session_token
    @user.reset_session_token!
    session[:session_token] = user.session_token

    #redirect them to a UsersController#show
    redirect_to users_url(@user.id)
  end
end
