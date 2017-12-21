class AddColumnToOrders < ActiveRecord::Migration[5.1]
  def up
    add_column :orders, :grand_total, :float
    add_column :orders, :shipping_charges, :float
  end
end
