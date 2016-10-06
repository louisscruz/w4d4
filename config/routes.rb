Rails.application.routes.draw do
  resources :users
  resource :session, only: [:new, :create, :destroy]
  resources :bands do
    resources :albums, only: [:new, :create]
    resources :tracks, only: [:new, :create]
  end
  resources :albums, only: [:edit, :show, :update, :destroy]
  resources :tracks, only: [:edit, :show, :update, :destroy]
  root to: "bands#index"
end
