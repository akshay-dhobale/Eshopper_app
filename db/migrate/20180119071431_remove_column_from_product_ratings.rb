class RemoveColumnFromProductRatings < ActiveRecord::Migration[5.1]
  def change
    remove_column :product_ratings, :rating, :string
    add_column :product_ratings, :rating, :float
  end
end
