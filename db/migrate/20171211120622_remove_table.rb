class RemoveTable < ActiveRecord::Migration[5.1]
  def change
  	remove_foreign_key :product_attribute_values, :product_attributes 
  	remove_foreign_key :product_attribute_assocs, :product_attributes
	remove_foreign_key :product_attribute_assocs, :product_attribute_values
	remove_foreign_key :product_attribute_assocs, :products

  	drop_table :product_attributes
  	drop_table :product_attribute_values
  	drop_table :product_attribute_assocs
  end
end
