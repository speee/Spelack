Rails.application.routes.draw do
  root "messages#index"
  resources :messages, only: %i(index create)
  devise_for :users
  mount ActionCable.server => '/cable'
end
