class PostsController < ApplicationController

  def index
    @posts = Post.all
    @post = current_user.post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

end
