class AddAttachmentProdImgToProductImages < ActiveRecord::Migration[5.0]
  def self.up
    change_table :product_images do |t|
      t.attachment :prod_img
    end
  end

  def self.down
    remove_attachment :product_images, :prod_img
  end
end
