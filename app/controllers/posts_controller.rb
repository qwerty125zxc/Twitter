class PostsController < ApplicationController
 before_action :authenticate_user!
 before_action :find_post, only: [:show, :edit, :update, :destroy]

  def new
  	@post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.like = 0
    if @post.save
      flash[:notice] = "post successfully created"
      redirect_to root_path
    else
      flash[:error] = "post has error with created"
      render 'new'
    end
  end

  def show
  end
  def update
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

private

  def post_params
    params.require(:post).permit(:user_id, :title, :body,  {posts: []})
  end

  def find_post
    @post = Post.find_by(id: params[:id])
  end


end
