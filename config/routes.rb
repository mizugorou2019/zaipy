Rails.application.routes.draw do
  devise_for :users
  
  root to: "items#index"

  resources :items do
    resources :pickups, only:[:create, :index]
  end

  resources :users, only: [:edit, :update, :destroy]


end
