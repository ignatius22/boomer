Rails.application.routes.draw do
  devise_for :users

  post 'connections/:id/follow', to: 'connections#follow', as: 'follow'
  post 'connections/:id/unfollow', to: 'connections#unfollow', as: 'unfollow'
  post 'connections/:id/accept', to: 'connections#accept', as: 'accept'
  post 'connections/:id/decline', to: 'connections#decline', as: 'decline'
  post 'connections/:id/cancel', to: 'connections#cancel', as: 'cancel'

  root to: 'posts#index'
  # resources :users, only: [:show]
  resources :users do
    resources :posts
  end

  resources :posts do
    resources :comments
  end
end
