class PagesController < ApplicationController
  before_action :checkprofile
  def index
  	if user_signed_in?
  		if current_user.userprofile.nil?
  			redirect_to new_userprofile_paths
  		end
  	end
    @user = User.find_by(id: params[:id])
  	@posts = Post.all
    @post = Post.find_by(id: params[:id])
    @users = User.all
  end

  def checkprofile
    if user_signed_in?
      redirect_to new_userprofile_path if current_user.userprofile.nil?
    end
  end
end
