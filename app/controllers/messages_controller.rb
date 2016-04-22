class MessagesController < ApplicationController
  def index
  end
  def create
    ActionCable.server.broadcast "messages",
      body: params[:message][:body],
      username: params[:message][:username]
    head :ok
  end
end
