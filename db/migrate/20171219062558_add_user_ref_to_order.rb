class AddUserRefToOrder < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :user, foreign_key: true
    add_reference :orders, :address, foreign_key: true
    add_reference :orders, :coupon, foreign_key: true
  end
end
