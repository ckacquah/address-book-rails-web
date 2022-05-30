Rails.application.routes.draw do
  root "home#index"
  get 'home/index'
  resources :contacts
  resources :localities
  resources :suburbs
  resources :city_towns
  resources :regions
  devise_for :users
end
