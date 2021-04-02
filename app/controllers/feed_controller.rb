class FeedController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @friends = current_user.friends
  end

  def add_friend
    @user = User.find(params[:id])
    current_user.send_invitation(@user)
  end
end
