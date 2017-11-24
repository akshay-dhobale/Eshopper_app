Rails.application.routes.draw do
  get 'home/index'

  devise_for :admin_users
  resources :admin_users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'
  
  resources :banners
  
  resources :users

  resources :products 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
