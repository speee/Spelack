class AddAvatarToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar, :string, null: false, default: 'default_avatar.png'
  end
end
