class PagesController < ApplicationController
  before_action :checkprofile
  def index
  	if user_signed_in?
  		if current_user.userprofile.nil?
  			redirect_to new_userprofile_paths
  		end
  	end
  	@posts = Post.all
  end

  def checkprofile
    if user_signed_in?
      redirect_to new_userprofile_path if current_user.userprofile.nil?
    end
  end
end
