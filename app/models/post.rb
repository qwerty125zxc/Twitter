class Post < ApplicationRecord
	mount_uploader :photo, PhotoUploader
	serialize :photo, JSON # If you use SQLite, add this line.
	belongs_to :user
  validates :title, :body, :like, presence: true
	has_many :likes, dependent: :destroy
	has_many :comments
end
