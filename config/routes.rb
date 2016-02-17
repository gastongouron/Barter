Rails.application.routes.draw do

  namespace :admin do
  get 'users/index'
  end

  get 'users/new'

  get 'users/create'

  get 'users/show'

  get "/signin", to: "sessions#new"

  namespace :admin do
    resources :users
  end

  post "/signin", to: "sessions#create"

  root "swaps#index"

# put "/swaps/:id" => "swaps#update"
  put "/swaps/:id" => "swaps#barter"


  resources :swaps do
    resources :barts
  end

  resources :users

end
