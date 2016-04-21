class Channel < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :is_private, presence: true
  validates :description, length: { maximum: 1000 }
  validates :created_user_id, presence: true
end
