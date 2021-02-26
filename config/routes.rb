Rails.application.routes.draw do

  devise_for :users

  resources :users, only: %i[ show ]
  get 'edit_profile', to: 'users#edit'
  patch 'profile', to: 'users#update'

  root 'posts#index'
  get 'tags/:tag', to: 'posts#index', as: :tag

  resources :streamings do
    resources :comments, module: :streamings
  end

  resources :posts do
    resources :comments, module: :posts
  end

  get 'home', to: 'homes#index'
end
