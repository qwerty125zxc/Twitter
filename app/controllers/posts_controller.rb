class PostsController < ApplicationController
 before_action :authenticate_user!
 before_action :find_post, only: [:show, :destroy]
  def new
  	@post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.like = 0
    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

private

  def post_params
    params.require(:post).permit(:user_id, :title, :body)
  end

  def find_post
    @post = Post.find_by(id: params[:id])
  end


end
