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
  
  resources :addresses

  get 'carts/index'

  post 'carts/create'

  delete 'carts/destroy'

  get 'carts/update'

  post 'carts/add_coupon', to:'carts#add_coupon'

  get 'subcategories/show'

  get 'brandcategories/show'

  get 'products/show'

  get 'brands/show'

  get 'home/index'
  post 'home/newsletter'

  get 'brandcategories/show'

  resources :addresses

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  resources :charges

  resources :banners

  resources :categories

  resources :subcategories

  resources :products 

  resources :wishlists
  
  resources :users do 
    get 'enter_email'
  end

  resources :contact_us

  resources :cms

  resources :product_ratings
  
  resources :orders do 
    get 'details', on: :member
  end
  
end
