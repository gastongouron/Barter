Rails.application.routes.draw do

  get 'users/new'

  get 'users/create'

  get 'users/show'

  root "swaps#index"

  resources :swaps do
    resources :barts
  end

  resources :users

end
