class SearchChannelsController < ApplicationController
  before_action :search_channels, only: [:index]

  def index
  end

  private

  def search_channels
    @channels = Channel.search(params[:query])
    @joined_channels = []
    @not_joined_channels = []
    @channels.each do |channel|
      # binding.pry
      if current_user.channels.exists?(channel.id) then
        @joined_channels << channel
      else
        @not_joined_channels << channel
      end
    end
  end

end
