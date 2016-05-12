class AddAttachmentAvatarToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :avatar, null: false, default: 'default_avatar.png'
    end
  end

  def self.down
    remove_attachment :users, :avatar
  end
end
