Rails.application.routes.draw do
  devise_for :users

  resource :cart, only: [:show] do
    post 'add', on: :member
    post 'remove', on: :member
  end

  resources :connections, only: [] do
    member do
      post 'follow', 'unfollow', 'accept', 'decline', 'cancel'
    end
  end

  resources :users, only: [:show] do
    resources :posts, :products
  end

  resources :posts do
    resources :likes, module: :posts, only: %i[create destroy]
    resources :comments, only: %i[create destroy]
  end

  root to: 'posts#index'
end
