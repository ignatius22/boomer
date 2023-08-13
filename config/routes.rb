Rails.application.routes.draw do
  devise_for :users

  root to: 'posts#index'

  resources :users do
    resources :posts
  end

  resources :posts do
    resources :comments
  end
end
