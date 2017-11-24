class DropProductImages < ActiveRecord::Migration[5.1]
  def change
  	 drop_table :product_images
  end
end
