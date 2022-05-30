Rails.application.routes.draw do
  resources :contacts
  resources :localities
  resources :suburbs
  resources :city_towns
  resources :regions
  root "home#index"
  get 'home/index'
end
