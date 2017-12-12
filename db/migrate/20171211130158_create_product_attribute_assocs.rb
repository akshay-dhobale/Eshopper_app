class CreateProductAttributeAssocs < ActiveRecord::Migration[5.1]
  def change
    create_table :product_attribute_assocs do |t|
      t.references :product, foreign_key: true
      t.references :product_attribute, foreign_key: true
      t.references :product_attribute_value, foreign_key: true

      t.timestamps
    end
  end
end
