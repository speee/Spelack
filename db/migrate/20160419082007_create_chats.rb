class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats, id: false do |t|
      t.column :id, 'BIGINT PRIMARY KEY AUTO_INCREMENT'
      t.text :text
      t.integer :user_id
      t.integer :channel_id

      t.timestamps null: false
    end
  end
end
