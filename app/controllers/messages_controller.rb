class MessagesController < ApplicationController
    protect_from_forgery :secret => ["destroy"]
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

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    head :ok
  end

  private

  def message_params
    params.require(:message).permit(:text, :channel_id, :user_id)
  end
end
