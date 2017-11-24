class Brand < ApplicationRecord
	has_many :brandcategories	
	has_many :categories, through: :brandcategories
	has_many :products
end
