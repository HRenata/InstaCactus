Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end
  devise_for :users
  resources :users do
    member do
      get :following, :followers
    end  
  end
  resources :followings, only: %i[create destroy]
  get 'home/index'
  get 'users' => 'users#index', as: 'user_root'
  root to: 'home#index'
end
