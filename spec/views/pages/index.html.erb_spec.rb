require 'rails_helper'

RSpec.describe "pages/index", type: :view do
  let!(:user){create(:user)}
  let!(:profile){create(:userprofile, user: user)}


  before :each do
    @posts = assign(:post, [Post.create!(title: "title1", body: "body1", user: user, like: 0),
      Post.create!(title: "title2", body: "body2", user: user, like: 0)])
    controller.instance_variable_set(:@posts, @posts)
  end

    it "should show a post title"   do
      render
      expect(@posts[0].title).to eq('title1')
      expect(rendered).to include 'title1'
    end

    it "should show a link to post" do
      render
      expect(rendered).to include '<a href="/posts/1">Read More</a>'
      expect(rendered).to include '<a href="/posts/2">Read More</a>'
    end

    it "should show a post body" do
      render
      expect(@posts[0].body).to eq('body1')
      expect(rendered).to include 'body1'
    end

    it "should show a link to new post" do
      render
      expect(rendered).to include '<a href="/posts/new">Create new post</a>'
    end

    it "should show a user name" do
      render
      expect(rendered).to include 'User <b>tester</b>  write: '
    end

  end
