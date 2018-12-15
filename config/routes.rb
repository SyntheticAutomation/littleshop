Rails.application.routes.draw do


  root "welcome#index"

  resources :welcome, only: :index

  get '/register', to: "users#new"
  get '/login', to: "sessions#new"

  resources :items
  resources :users
  resources :merchants
  resources :orders
  resources :cart, only: :index













end
