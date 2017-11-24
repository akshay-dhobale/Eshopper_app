class ProductImage < ApplicationRecord
  # validates :image_image, :presence => true
  has_attached_file :prod_img
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
validates_attachment :prod_img,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  belongs_to :product
end
