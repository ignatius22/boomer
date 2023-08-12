Rails.application.routes.draw do
  devise_for :users

  root to: 'posts#index'

  resources :users do
    resources :posts
  end

  resources :posts, only: [:show, :index, :create] do
    resources :comments
  end
end
