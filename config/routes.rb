Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  
  root to: 'home#index'

  get 'users' => 'users#show_all'
  resources :users, only: [:show]
end
