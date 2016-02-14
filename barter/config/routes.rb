Rails.application.routes.draw do

  root "swaps#index"

  resources :swaps do
    resources :barts
  end

end
