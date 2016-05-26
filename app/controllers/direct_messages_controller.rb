class DirectMessagesController < ApplicationController
  before_action :search_users, only: [:index]
  before_action :set_dm_channels, only: [:index, :create]
  before_action :set_dm_params, only:[:create]
  def index
  end

  def create
    if @dm_channels.find {|n| n[:name] =~ /\Atest2\z/ || n[:name] =~ /\Atest2\z/ }
      redirect_to channels_path
    else
      @channel = Channel.new(@dm_params)
      if @channel.save
        current_user.channels << @channel
        redirect_to channel_path(@channel)
      else
          render :index
      end
    end
  end

  private
  def set_dm_params
    @dm_params = params.require(:channel).permit(:name, :description, :status).merge(author_id: current_user.id)
  end

  def search_users
    @users = User.search(params[:query])
  end

  def set_dm_channels
    @dm_channels = current_user.channels.where(status: 3)
  end
end
