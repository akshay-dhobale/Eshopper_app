class Cart < ApplicationRecord
  belongs_to :product
  belongs_to :user
  # belongs_to :coupons
  after_save do
	puts "Product added to cart"  	
  end
end
