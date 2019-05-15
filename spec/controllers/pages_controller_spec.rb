require 'rails_helper'

RSpec.describe PagesController, type: :controller do
    let!(:user) { build(:user, email: "test@gmail.com") }

login_user

  describe 'GET #index' do
    it "should redirect to create profile if there's no one" do
      get :index
      expect(response).to redirect_to new_userprofile_path
    end
  end

end
