class CreateOrderDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :order_details do |t|
      t.integer :quantity
      t.float :amount

      t.timestamps
    end
  end
end
