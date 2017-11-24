class AddQuantityColumnToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :quantity, :integer
    add_column :products, :status, :boolean
    add_column :products, :price, :decimal, precision: 14, scale: 2
    add_column :products, :special_price, :decimal, precision: 14, scale: 2
    add_column :products, :special_price_from, :date
    add_column :products, :special_price_to, :date


    add_column :products, :meta_title, :string
  end
end
