class UsersController < ApplicationController

  #don't need to make new because the default is just
  # def new
  #   render :new
  # end

  def show
    @user = Cat.find(params[:id])
    render :show
    #show user email
  end

  def create
    @user = User.new(user_params)
    # debugger
    if @user.save!
      login!(@user)
      redirect_to users_url(@user.id)
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
