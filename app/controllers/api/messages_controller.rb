class Api::MessagesController < ApplicationController
  def index
    messages = Message.all
    render json: messages.to_json(methods: :nickname)
  end

  def show
    messages = Message.where(channel_id: params[:channel_id])
    render json: messages.to_json(methods: :nickname)
  end

  private

  def message_params
    params.require(:message).permit(:text, :channel_id, :user_id)
  end
end
