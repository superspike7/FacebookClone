class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.where("id != ?", current_user.id)
  end

  def invite
    @user = User.find(params[:id])
    if current_user.send_invitation(@user)
      redirect_to :friend_requests
    else
      flash[:alert] = "something went wrong"
      render :index
    end
  end

  def friends
    @friends = current_user.friends
  end

  def friend_requests
    @requests = current_user.invitations
  end

end
