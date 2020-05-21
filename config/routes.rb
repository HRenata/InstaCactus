Rails.application.routes.draw do
  resources :posts
  devise_for :users
  resources :users do
    member do
      get :following, :followers
    end  
  end
  resources :followings, only: %i[create destroy]
  get 'home/index'
  
  root to: 'home#index'
end
