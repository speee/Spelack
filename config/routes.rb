Rails.application.routes.draw do
  root 'channels#index'
  devise_for :users
  resources :channels
  resources :messages, only: %i(index create)
  mount ActionCable.server => '/cable'
end
