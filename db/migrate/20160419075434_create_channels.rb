class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :name, limit: 190, null: false
      t.boolean :is_private,  default: false, null: false
      t.string :description
      t.integer :created_user_id

      t.timestamps null: false
    end
    add_index :channels, :name, unique: true
  end
end
