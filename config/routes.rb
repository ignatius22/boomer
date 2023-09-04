Rails.application.routes.draw do
  devise_for :users

  # Connections
  resources :connections, only: [] do
    member do
      post 'follow'
      post 'unfollow'
      post 'accept'
      post 'decline'
      post 'cancel'
    end
  end

  # Users
  resources :users, only: [:show] do
    resources :posts
    resources :products
  end

  # Posts
  resources :posts do
    resources :likes, module: :posts
    resources :comments
  end

  # Cart
  resource :cart, only: [:show] do
    member do
      post 'add_to_cart'
      delete 'remove_from_cart'
    end
  end

  root to: 'posts#index'
end
