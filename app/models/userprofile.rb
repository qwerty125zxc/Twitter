class Userprofile < ApplicationRecord
	mount_uploader :avatar, AvatarUploader
	belongs_to :user
  validates :name, presence: true
  validates :name, uniqueness: true
end
