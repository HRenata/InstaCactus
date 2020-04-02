Rails.application.routes.draw do
  resources :posts
  devise_for :users
  resources :users
  get 'home/index'
  
  root to: 'home#index'
end
