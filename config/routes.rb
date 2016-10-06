Rails.application.routes.draw do
  resources :users
  resource :session, only: [:new, :create, :destroy]
  resources :bands do
    resources :albums, only: [:new]
    resources :tracks, only: [:new]
  end
  resources :albums, only: [:create, :edit, :show, :update, :destroy]
  resources :tracks, only: [:create, :edit, :show, :update, :destroy]
end
