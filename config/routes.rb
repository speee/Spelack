Rails.application.routes.draw do
  # root 'channels#index'
  root 'users#index'
  devise_for :users
  resources :channels
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
