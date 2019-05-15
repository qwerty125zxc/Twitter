class PagesController < ApplicationController
  def index
  	if user_signed_in?
  		if current.user.userprofile.nil?
  			redirect_to new_userprofile_paths
  		end
  	end
  	@posts = Post.all
  end
end
