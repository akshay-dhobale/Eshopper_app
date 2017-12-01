Rails.application.routes.draw do
  # get 'subcategories/index'

  get 'subcategories/show'

  get 'brandcategories/show'

  get 'products/show'

  get 'brands/show'

  get 'home/index'

  get 'brandcategories/show'

  get 'subcategories/show'

  # get "/fetch_items" => 'items#from_category', as: 'fetch_items'

  devise_for :users
  resources :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'
  
  resources :banners

  # get 'categories/show'
  resources :categories

  resources :products 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
