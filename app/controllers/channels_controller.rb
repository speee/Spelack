class ChannelsController < ApplicationController
  before_action :set_channel, only: [:show, :edit, :update, :destroy, :join]
  before_action :search_channels, only: [:search]
  before_action :check_joined, only: [:show]
  before_action :set_channels, only: [:index]


  def index
  end

  def new
    @channel = Channel.new
  end

  def create
    if @channel = current_user.channels.create(channel_params)
      redirect_to channel_path(@channel)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @channel.soft_destroy
  end

  def update
    if @channel.update(channel_params)
      redirect_to channel_path(@channel)
    else
      render :edit
    end
  end

  def join
    @channel.users << current_user
    redirect_to channel_path(@channel)
  end

  def search
  end

  private

  def check_joined
    @joind = @channel.users.exists?(current_user.id)
  end

  def set_channel
    @channel = Channel.friendly.find(params[:id])
  end

  def set_channels
    @channels = current_user.channels.without_soft_destroyed
  end

  def search_channels
    @channels = Channel.search(params[:query])
  end

  def channel_params
    params.require(:channel).permit(:name, :description, :status).merge(author_id: current_user.id)
  end
end
