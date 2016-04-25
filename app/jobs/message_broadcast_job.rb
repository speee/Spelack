class MessageBroadcastJob < ActiveJob::Base
  queue_as :default

  def perform(message)
      ActionCable.server.broadcast 'messages',
      body: params[:message][:body],
      username: params[:message][:username]
  end
end
