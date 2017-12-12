class RemoveColumnsFromWishlist < ActiveRecord::Migration[5.1]
  def change
  	remove_column :wishlists, :user_id, :integer
  	remove_column :wishlists, :product_id, :integer
  end
end
