class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :after_sign_up]
  def index
  end

  def after_sign_up
  end
end
