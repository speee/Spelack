class MessagesController < ApplicationController
  protect_from_forgery :except => [:create]

  def index
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      MessageBroadcastJob.perform_later(@message)
      head :ok
    else
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:text, :channel_id, :user_id)
  end
end
