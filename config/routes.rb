Rails.application.routes.draw do
  get 'rooms/show'
  devise_for :users
mount ActionCable.server => '/cable'
end
