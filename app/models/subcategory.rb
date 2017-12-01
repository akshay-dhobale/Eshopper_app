class Subcategory < ApplicationRecord
  belongs_to :category

  has_many :productsubcategories

  has_many :products, through: :productsubcategories
end
