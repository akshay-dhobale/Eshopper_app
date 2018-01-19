class CreateProductRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :product_ratings do |t|
      t.references :product, foreign_key: true
      t.integer :rating
      t.references :user, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end
