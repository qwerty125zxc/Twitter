class UserprofilesController < ApplicationController
  def new
  	@userprofile = Userprofile.new
  end

  def create
    @userprofile = current_user.build_userprofile(profile_params)
    if @userprofile.save
      redirect_to userprofile_path(@userprofile.id)
      else render 'new'
    end

  end
  def edit
  	@userprofile = current_user.userprofile
  end

  def show
    @post = Post.new
  end

  def update
    @userprofile = Userprofile.find_by(user_id: current_user.id)
    if @userprofile.update(profile_params)
       redirect_to user_path(@userprofile.id)
     else render 'new'
    end

  end

  private

  def profile_params
    params.require(:userprofile).permit(:user_id, :name, :description)
  end

end
