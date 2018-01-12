class Product < ApplicationRecord
  belongs_to :brand

  has_many :product_images, dependent: :destroy

  has_many :product_categories, dependent: :destroy

  has_many :categories, through: :product_categories

  has_many :productsubcategories, dependent: :destroy

  has_many :subcategories, through: :productsubcategories

  has_many :carts

  has_many :wishlists

  has_many :product_attribute_assocs, dependent: :destroy

  has_many :product_attributes, through: :product_attribute_assocs

  has_many :product_attribute_values, through: :product_attribute_assocs

  
end
