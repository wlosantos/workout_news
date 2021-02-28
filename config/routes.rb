Rails.application.routes.draw do

  devise_for :users
  resources :users, only: %i[ show ]
  get 'edit_profile', to: 'users#edit'
  get 'adm_profile', to: 'users#profile'
  patch 'profile', to: 'users#update'

  root 'posts#index'
  get 'tags/:tag', to: 'posts#index', as: :tag
  get 'home', to: 'homes#index'

  resources :streamings do
    resources :comments, module: :streamings
  end

  resources :posts do
    resources :comments, module: :posts
  end

  resources :friends, only: %i[ create update ]

end
