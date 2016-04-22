class ChannelsController < ApplicationController
  def index
  end

  def new
    @channel = Channel.new
  end

  def create
    @channel = Channel.new(channel_params)
    if @channel.save
      redirect_to channel_path(@channel)
    else
      render :new
    end
  end

  def channel_params
    params.require(:channel).permit(:name, :description, :status, :author_id)
  end
end
