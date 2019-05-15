require 'rails_helper'

RSpec.describe Userprofile, type: :model do
  let!(:user){create(:user)}

  subject{
     build(:userprofile, user: user)
  }

  context "validation" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "should not be valid without nickname" do
       subject.name = nil
       expect(subject).to_not be_valid
    end

    it { should validate_presence_of(:name) }
  end

  context "association" do
    it { should belong_to(:user) }
  end


 context "when user name is already taken" do
   before do
    profile_dub = create(:userprofile, user: user)
   end

   it { should_not be_valid }
 end

end
