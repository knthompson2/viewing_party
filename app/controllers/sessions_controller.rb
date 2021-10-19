class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "You've been logged in!"
      redirect_to user_dashboard_path(user)
    else
      flash[:error] = 'Invalid Login! Check credentials or register as a user'
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've been logged out"
    redirect_to root_path
  end
end
