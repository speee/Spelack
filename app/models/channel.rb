class Channel < ActiveRecord::Base
  soft_deletable column: :delete_at
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :status, presence: true
  validates :description, length: { maximum: 255 }
  validates :author_id, presence: true

  def self.search(search)
    if search
      Channel.where(['name LIKE ? ', "%#{search}%"]).without_soft_destroyed
    else
      Channel.without_soft_destroyed
    end
  end
end
