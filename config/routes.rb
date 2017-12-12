Rails.application.routes.draw do
  get 'addresses/index'

  get 'addresses/show'

  get 'addresses/edit'
  
  get 'addresses/destroy'

  get 'carts/index'

  get 'carts/create'

  get 'carts/destroy'

  get 'carts/update'
  # get 'subcategories/index'

  get 'subcategories/show'

  get 'brandcategories/show'

  get 'products/show'

  get 'brands/show'

  get 'home/index'

  get 'brandcategories/show'

  # get 'subcategories/show'
  resources :addresses
  # get "/fetch_items" => 'items#from_category', as: 'fetch_items'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

  # get "users/show"
  # get "users/edit"
  
  # resources :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'
  
  resources :banners

  # get 'categories/show'
  resources :categories

  resources :subcategories

  resources :products 


  get 'wishlists/index'

  get 'wishlists/create'

  get 'wishlists/destroy'

  # resources :carts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
