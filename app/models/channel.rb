class Channel < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :status, presence: true
  validates :description, length: { maximum: 255 }
  validates :author_id, presence: true
end
