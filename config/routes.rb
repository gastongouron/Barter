Rails.application.routes.draw do

  namespace :admin do
  get 'users/index'
  end

  get 'users/new'

  get 'users/create'

  get 'users/show'

  get "/signin", to: "sessions#new"

  namespace :admin do
    root :to => "base#index"
    resources :users
  end

  post "/signin", to: "sessions#create"

  root "services#index"

  put "/services/:id" => "services#helper"

  delete "/signout", to: "sessions#destroy", as: "signout"

  resources :services do
    resources :helps
  end

  resources :conversations do
    resources :messages
  end

  resources :users

end
