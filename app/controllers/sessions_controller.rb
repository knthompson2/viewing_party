class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    flash[:success] = "Welcome, #{user.username}!"
    redirect_to user_dashboard_path(user)
  end

  def destroy
  end
end
