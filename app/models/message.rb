class Message < ActiveRecord::Base
  validates :text, presence: true, length: { maximum: 4000 }
end
