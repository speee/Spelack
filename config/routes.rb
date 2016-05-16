Rails.application.routes.draw do
  namespace 'api' do
    get 'messages/index'
    resources :messages, only: :index
  end
  resources :messages, only: %i(index create update destroy)
  devise_for :users
  mount ActionCable.server => '/cable'
end
