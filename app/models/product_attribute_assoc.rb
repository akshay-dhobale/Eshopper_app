class ProductAttributeAssoc < ApplicationRecord
  belongs_to :product
  belongs_to :product_attribute
  belongs_to :product_attribute_value
end
