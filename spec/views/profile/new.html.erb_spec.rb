require 'rails_helper'

RSpec.describe "profile/new", type: :view do

  let!(:user){create(:user)}

  it "should rendered partial :'profile/form'" do
    allow(view).to receive(:current_user).and_return(user)
    stub_template "profile/_form.html.erb" => "Create new profile"
    render
    expect(rendered).to match 'Create new profile'
  end

  before do
    @profile = assign(:profile, create(:profile, user: user))
  end

  it "should show form for 'Create new profile'" do
    allow(view).to receive(:current_user).and_return(user)
    render
    expect(rendered).to include "multipart/form-data"
  end

end
