Rails.application.routes.draw do

  devise_for :users
  root 'home#index'
  get 'tags/:tag', to: 'posts#index', as: :tag

  resources :posts


end
