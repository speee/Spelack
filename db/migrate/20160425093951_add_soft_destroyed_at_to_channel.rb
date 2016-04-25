class AddSoftDestroyedAtToChannel < ActiveRecord::Migration
  def change
    add_column :channels, :soft_destroyed_at, :datetime
    add_index :channels, :soft_destroyed_at
  end
end
