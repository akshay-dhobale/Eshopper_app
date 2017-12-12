class CreateProductAttributeValues < ActiveRecord::Migration[5.1]
  def change
    create_table :product_attribute_values do |t|
      t.string :attr_value

      t.timestamps
    end
  end
end
