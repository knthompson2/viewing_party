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
      session[:user_id] = new_user.id
      redirect_to user_dashboard_path(new_user)
      flash[:success] = "You've successfully registered. You can now log in!"
    else
      redirect_to new_user_path
      flash[:error] = 'Sorry, you have missing or invalid credentials!'
    end
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
