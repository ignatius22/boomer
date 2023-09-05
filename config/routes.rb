Rails.application.routes.draw do
  devise_for :users

  resources :connections, only: [] do
    member do
      post 'follow'
      post 'unfollow'
      post 'accept'
      post 'decline'
      post 'cancel'
    end
  end

  resources :users, only: [:show] do
    resources :posts
    resources :products
  end

  resources :posts do
    resources :likes, module: :posts
    resources :comments
  end

  resource :cart, only: [:show] do
    post 'add_to_cart', on: :member
    delete 'remove_from_cart', on: :member
  end

  root to: 'posts#index'
end
