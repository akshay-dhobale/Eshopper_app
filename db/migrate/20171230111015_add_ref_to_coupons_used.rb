class AddRefToCouponsUsed < ActiveRecord::Migration[5.1]
  def change
    add_reference :coupons_useds, :user, foreign_key: true
    add_reference :coupons_useds, :order, foreign_key: true
    add_reference :coupons_useds, :coupon, foreign_key: true
  end
end
