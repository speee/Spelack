class Api::MessagesController < ApplicationController
  def index
    messages = Message.all
    render json: messages.to_json(methods: :nickname)
  end
end
