class CreateSharedFiles < ActiveRecord::Migration
  def change
    create_table :shared_files do |t|
      t.integer   :user_id
      t.integer   :channel_id

      t.timestamps null: false
    end
  end
end
