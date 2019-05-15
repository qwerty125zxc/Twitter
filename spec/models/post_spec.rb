require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:user){create(:user)}

  subject{
     build(:post, user: user)
  }

  context "validation" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "should not be valid without title" do
       subject.title = nil
       expect(subject).to_not be_valid
    end

    it { should validate_presence_of(:title) }

    it "should not be valid without body" do
       subject.body = nil
       expect(subject).to_not be_valid
    end

    it { should validate_presence_of(:body) }

    it "should not be valid without like" do
       subject.like = nil
       expect(subject).to_not be_valid
    end

    it { should validate_presence_of(:like) }
  end

  context "default value" do
    it "should have a default value for like" do
      pp subject
      expect(subject.like).to equal 0
    end
  end

  context "association" do
    it { should belong_to(:user) }
  end

end
