class Post < ApplicationRecord
	belongs_to :user
  validates :title, :body, :like, presence: true
end
