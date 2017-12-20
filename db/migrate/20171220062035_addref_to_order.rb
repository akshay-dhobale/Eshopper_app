class AddrefToOrder < ActiveRecord::Migration[5.1]
  def change
  	 add_reference :orders, :payment_gateway, foreign_key: true
  end
end
