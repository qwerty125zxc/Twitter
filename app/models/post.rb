class Post < ApplicationRecord
	belongs_to :user
  validates :title, :body, :like, presence: true
	has_many :likes, dependent: :destroy
	has_many :comments
end
