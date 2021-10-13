class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:username] = user[:username].downcase
    user[:email] = user[:email].downcase
    new_user = User.create(user)
    if new_user.save
      redirect_to root_path
      flash[:success] = "You've successfully registered. You can now log in!"
    else
      redirect_to new_user_path
      flash[:error] = "Sorry, you have missing or invalid credentials!"
    end
  end

  def show
    @user = User.find_by(username: params[:username])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
