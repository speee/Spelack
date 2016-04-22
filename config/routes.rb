Rails.application.routes.draw do
  resources :messages, only: %i(index create)
  devise_for :users
  mount ActionCable.server => '/cable'
end
