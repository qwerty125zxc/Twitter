require 'rails_helper'

RSpec.describe UserprofilesController, type: :controller do
    let!(:user) { build(:user, email: "test@gmail.com") }

login_user

  it "should have a current_user" do
    expect(subject.current_user).to_not eq(nil)
  end

  describe 'GET #new' do
    it "should find current_user and open form for create Userprofile" do
      get :new
      expect(subject.current_user.email).to eq("tester@test.com")
      expect(subject.current_user.email).to_not eq(user.email)
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    it "should create userprofile and redirect to index page" do
      post :create, params: {userprofile: {name:"Tester"}}
      expect(subject.current_user.userprofile.name).to eq("Tester")
      expect(response).to redirect_to userprofile_path(1)
    end
  end

  describe 'GET #edit' do
    it "should find current_user and open form for edit Userprofile" do
      get :edit, xhr: true, format: :js, params: {id: subject.current_user.id}
      expect(subject.current_user.email).to eq("tester@test.com")
      expect(subject.current_user.email).to_not eq(user.email)
      expect(response).to have_http_status(200)
    end
  end

  describe 'PATCH #update' do
    before do
      @userparam = create(:userprofile, user_id: subject.current_user.id)
    end
    it "should update userparam and redirect to profile" do
      patch :update, params: { id: subject.current_user.id, userprofile: {name: "Tester2"}}
      expect(subject.current_user.userprofile.name).to eq("Tester2")
      expect(response).to redirect_to userprofile_path(1)
    end
  end

end
