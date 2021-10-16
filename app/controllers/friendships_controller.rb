class FriendshipsController < ApplicationController
  def create
    friend = User.find_by(email: params[:email])
    friendship = Friendship.find_by(user: current_user, friend: friend)
    # binding.pry
    if friend && friend.email == current_user.email
      flash[:error] = 'You cannot add yourself as a friend'
    elsif friend && friendship.nil?
      current_user.friendships.create(friend: friend)
      flash[:success] = "You've successfully added a new friend!"
    elsif friend && friendship
      flash[:error] = 'You are already friends with that person'
    else
      flash[:error] = 'Invalid email. You have not added a new friend.'
    end
    redirect_to user_dashboard_path(current_user)
  end
end
