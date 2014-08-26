Rails.application.routes.draw do
  devise_for :users
  root to: 'administrations#index'

  resources :administrations
  resources :users
end
