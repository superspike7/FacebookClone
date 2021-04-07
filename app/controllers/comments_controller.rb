class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to root_path
    else
      flash[:notice] = "invalid params"
      redirect_to root_path 
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:body, :post_id, :user_id).with_defaults(user_id: current_user.id)
  end

end
