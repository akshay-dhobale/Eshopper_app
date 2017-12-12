class ProductImage < ApplicationRecord
  has_attached_file :prod_img
  # , styles: { medium: "300x300>", thumb: "100x100>",large: "500x500>" }, default_url: "/images/:style/missing.png"
  # validates_attachment_content_type :prod_img, content_type: /\Aimage\/.*\z/

  validates_attachment :prod_img,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  
  belongs_to :product
end
