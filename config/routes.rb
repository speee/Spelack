Rails.application.routes.draw do
  root 'users#index'
  devise_for :users
  resources :channels do
    member do
      get 'join'
    end

    collection do
      get 'search'
    end
  end
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
