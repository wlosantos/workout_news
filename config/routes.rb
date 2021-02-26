Rails.application.routes.draw do

  get 'comments/create'
  devise_for :users
  root 'home#index'
  get 'tags/:tag', to: 'posts#index', as: :tag

  resources :posts do
    resources :comments, module: :posts
  end

end
