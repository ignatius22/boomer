Rails.application.routes.draw do
  devise_for :users

  root to: 'posts#index'

  resources :users do
    resources :posts, except: [:show, :index]
  end

  resources :posts, only: [:show, :index] do
    resources :comments
  end
end
