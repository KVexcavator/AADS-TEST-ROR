class PagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.where.not(id: current_user.id)
  end

  def subscribe
    user_to_follow = User.find(params[:id])
    current_user.followed_users << user_to_follow
    redirect_to pages_index_path, notice: 'You have subscribed successfully.'
  end

  def unsubscribe
    user_to_unfollow = User.find(params[:id])
    current_user.followed_users.delete(user_to_unfollow)
    redirect_to pages_index_path, notice: 'You have unsubscribed successfully.'
  end
end
