class CreateCouponsUseds < ActiveRecord::Migration[5.1]
  def change
    create_table :coupons_useds do |t|

      t.timestamps
    end
  end
end
