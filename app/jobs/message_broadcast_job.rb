class MessageBroadcastJob < ActiveJob::Base
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast 'messages',
      body: message.text,
      username: message.user_id
  end
end
