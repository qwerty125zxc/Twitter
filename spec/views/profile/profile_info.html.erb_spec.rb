require 'rails_helper'

RSpec.describe "profile/profile_info", type: :view do
  let!(:user){create(:user)}

  before :each do
    @profile = assign(:profile, create(:profile, user: user))
  end

  it "should rendered partial :'profile_info'" do
    allow(view).to receive(:current_user).and_return(user)
    render :partial => "profile/info.html.erb"
    expect(rendered).to include '<p>Nickname: tester</p>'
    expect(rendered).to include '<p>Country: Test</p>'
  end

  it "should show a profile information inside id = info" do
    allow(view).to receive(:current_user).and_return(user)
    render
    expect(rendered).to include "$('#info').html"
  end

end
