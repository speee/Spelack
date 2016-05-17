class MessageBroadcastJob < ActiveJob::Base
  queue_as :default

  def perform(message)
    message_hash = JSON.parse(message.to_json)
    message_hash["nickname"] = message.user.nickname
    ActionCable.server.broadcast 'messages',
      message_hash.to_json
  end
end
