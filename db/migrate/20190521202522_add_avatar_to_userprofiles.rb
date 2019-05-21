class AddAvatarToUserprofiles < ActiveRecord::Migration[5.2]
  def change
    add_column :userprofiles, :avatar, :string
  end
end
