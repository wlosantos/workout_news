Rails.application.routes.draw do

  devise_for :users

  resources :users, only: %i[ show ]#, params: :username
  get 'edit_profile', to: 'users#edit'
  patch 'profile', to: 'users#update'

  root 'home#index'
  get 'tags/:tag', to: 'posts#index', as: :tag

  resources :posts do
    resources :comments, module: :posts
  end

end
