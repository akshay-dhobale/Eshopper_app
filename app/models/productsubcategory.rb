class Productsubcategory < ApplicationRecord
  belongs_to :product
  belongs_to :subcategory
end
