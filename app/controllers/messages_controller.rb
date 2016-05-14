class MessagesController < ApplicationController
  def index
    @messages = Message.all
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

  def delete
    @message = Message.id(params[:id])
    @message.destroy
  end

  private

  def message_params
    params.require(:message).permit(:text, :channel_id, :user_id)
  end
end
