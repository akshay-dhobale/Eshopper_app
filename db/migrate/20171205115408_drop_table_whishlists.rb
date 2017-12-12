class DropTableWhishlists < ActiveRecord::Migration[5.1]
  def change
  	drop_table :wishlists
  end
end
