class ProfilesController < ApplicationController

  def show
    @user = User.find(params[:id]) 
    @posts = Post.all.where(user_id: @user.id) 
    @post = @user.post.new
  end


  private


end
