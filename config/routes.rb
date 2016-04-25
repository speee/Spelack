Rails.application.routes.draw do
  root 'channels#index'
  devise_for :users
  resources :channels, except: [:destroy]
end
