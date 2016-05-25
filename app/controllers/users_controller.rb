class UsersController < ApplicationController
  def index
    # asset_path('top_movie.mp4')
    @movie_path = 'top_movie.mp4'
  end

  def after_sign_up
  end
end
