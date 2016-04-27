class Channel < ActiveRecord::Base
  soft_deletable column: :delete_at
  validates :name, presence: true, format: { with: /\A[a-z0-9]+\z/i }, length: { maximum: 50 }, uniqueness: true
  validates :status, presence: true
  validates :description, length: { maximum: 255 }
  validates :author_id, presence: true
  def to_param
    # URLで指定する項目を指定
    name
  end

  def self.find_for_id_from_name(name)
    Channel.find_by(name: name)
  end

  def self.search(query)
    if query
      Channel.where(['name LIKE ? ', "%#{query}%"]).without_soft_destroyed
    else
      Channel.without_soft_destroyed
    end
  end
end
