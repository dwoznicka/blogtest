Rails.application.routes.draw do

  devise_for :users
  root 'posts#index'
  resources :users
  resources :posts
  resources :comments
  resources :favourites
  resources :profiles
  resources :roles
end
