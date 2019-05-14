require 'rails_helper'

RSpec.describe "profile/edit", type: :view do

  let!(:user){create(:user)}

  it "should rendered partial :'profile/form'" do
    allow(view).to receive(:current_user).and_return(user)
    stub_template "profile/_form.html.erb" => "Edit profile"
    render
    expect(rendered).to match 'Edit profile'
  end

  before do
    @profile = assign(:profile, create(:profile, user: user))
  end

  it "should show form for 'Create new profile'" do
    allow(view).to receive(:current_user).and_return(user)
    render
    expect(rendered).to include "multipart/form-data"
  end

  it "should show data from Profile" do
    allow(view).to receive(:current_user).and_return(user)
    render
    expect(rendered).to include "<div class=\\\"field\\\">\\n    <input class=\\\"form-control\\\" placeholder=\\\"Input Nickname\\\" type=\\\"text\\\" value=\\\"tester\\\" name=\\\"profile[nickname]\\\" />"
  end

end
