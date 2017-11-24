class Product < ApplicationRecord
	belongs_to :brand
	
	has_many :product_images, dependent: :destroy

	has_many :product_categories, dependent: :destroy

	has_many :categories, through: :product_categories

end
