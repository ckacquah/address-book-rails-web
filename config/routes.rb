Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  resources :contacts
  resources :localities
  resources :suburbs
  resources :city_towns
  resources :regions
  devise_for :users

  get 'get_cities' => 'contacts#get_cities'
  get 'get_suburbs' => 'contacts#get_suburbs'
  get 'get_localities' => 'contacts#get_localities'
end
