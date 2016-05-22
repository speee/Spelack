class AddColumnToUserChannels < ActiveRecord::Migration
  def change
    add_column :user_channels, :status, :integer
  end
end
