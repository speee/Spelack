class MessagesController < ApplicationController
  def index
  end

  def create
    MessageBroadcastJob.perform_later(@message)
    head :ok
  end
end
