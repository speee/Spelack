Rails.application.routes.draw do
  devise_for :users

  resources :channel, only: [:new, :create]
end
