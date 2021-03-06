Rails.application.routes.draw do
  get 'orders/index'
  devise_for :users

  root to: "items#index"

  resources :items do
    resources :orders, only:[:create, :index, :destroy]
  end

  resources :users, only: [:edit, :update, :destroy]
  resources :rooms, only: [:new, :create]


end
