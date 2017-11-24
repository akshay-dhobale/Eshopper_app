class Brandcategory < ApplicationRecord
  belongs_to :brand
  belongs_to :category
end
