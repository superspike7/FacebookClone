class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.where("id != ?", current_user.id)
  end

  def invite
    @user = User.find(params[:id])
    if current_user.send_invitation(@user)
      redirect_to friend_requests_url
    else
      flash[:alert] = "something went wrong"
      render :index
    end
  end

  def friends
    @friends = current_user.friends
  end

  def friend_requests
    @users = User.all
    @friends = current_user.friends
    @requests = current_user.invitations
    @pending_requests = current_user.pending_invitations
  end

  def delete_request 
    @user_id = params[:id]
    current_user.invitations.find_by(friend_id: @user_id).destroy
    redirect_to friend_requests_url
  end

  def accept_request
    @user = User.find(params[:id])
    current_user.accept_invitation(@user)
    redirect_to friend_requests_url
  end

  def unfriend
    @user = User.find(params[:id])
    Invitation.find_by(user_id: @user.id).destroy
    redirect_to friend_requests_url
  end
end