class Category < ApplicationRecord
	has_many :product_categories, dependent: :destroy
	has_many :brandcategories, dependent: :destroy
	has_many :brands, through: :brandcategories
	has_many :products, through: :product_categories
end
