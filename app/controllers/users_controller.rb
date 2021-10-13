class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    User.create(user_params)
    redirect_to root_path
    flash[:success] = "You've successfully registered. You can now log in!"
  end

  def show
    @user = User.find_by(username: params[:username])
  end
private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
