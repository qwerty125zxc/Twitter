class Post < ApplicationRecord
	belongs_to :user
  validates :title, :body, :like, presence: true
  validates :title, :body, length: { maximum: 10 }
end
