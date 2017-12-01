class CreateProductsubcategories < ActiveRecord::Migration[5.1]
  def change
    create_table :productsubcategories do |t|
      t.references :product, foreign_key: true
      t.references :subcategory, foreign_key: true

      t.timestamps
    end
  end
end
