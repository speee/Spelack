class ChangeDateTypeLimt < ActiveRecord::Migration
  def change
    change_column :users, :email, :string, limit: 190
    change_column :users, :nickname, :string, limit: 190
    change_column :users, :reset_password_token, :string, limit: 190
    change_column :channels, :name, :string, limit: 190
  end
end
