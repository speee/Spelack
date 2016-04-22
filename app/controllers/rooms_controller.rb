class RoomsController < ApplicationController
  def show
    @messages = Message.all
  end
  def create
    ActionCable.server.broadcast "messages",
      body: params[:message][:body],
      username: params[:message][:username]
    head :ok
  end
end
