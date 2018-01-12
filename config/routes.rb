Rails.application.routes.draw do
  get 'coupons_useds/index'

  get 'reports/sales_report'

  get 'reports/customer_registered'

  get 'reports/coupons_used'

  get 'reports/index'

  get 'checkouts/address_select'

  get 'checkouts/payment_review'

  get 'checkouts/payment_option'

  get 'checkouts/add_address'

  root 'home#index'
  
  # get 'addresses/index'

  # get 'addresses/show'

  # get 'addresses/edit'
  
  # get 'addresses/destroy'
  resources :addresses

  get 'carts/index'

  post 'carts/create'

  delete 'carts/destroy'

  get 'carts/update'

  post 'carts/add_coupon', to:'carts#add_coupon'

  # get 'subcategories/index'

  get 'subcategories/show'

  get 'brandcategories/show'

  get 'products/show'

  get 'brands/show'

  get 'home/index'
  post 'home/newsletter'

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
  
  resources :charges

  resources :banners

  # resources :checkouts
  # get 'categories/show'
  resources :categories

  resources :subcategories

  resources :products 

  resources :wishlists
  
  resources :users do 
    get 'enter_email'
  end

  # resources :newsletters
  resources :contact_us

  resources :cms
  resources :orders do 
  # post 'orders/create'
  # get 'orders/show'
    get 'details', on: :member
  end
  
  # resources :carts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
