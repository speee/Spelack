class Message < ActiveRecord::Base
  validates :text, presence: true
end
