class ProductImage < ApplicationRecord
  has_attached_file :prod_img

  validates_attachment :prod_img,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  
  belongs_to :product
end
