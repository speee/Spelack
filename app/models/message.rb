class Message < ActiveRecord::Base
  belongs_to :user
  validates :text, presence: true, length: { maximum: 4000 }
end
