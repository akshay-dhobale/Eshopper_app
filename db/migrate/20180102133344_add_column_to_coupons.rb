class AddColumnToCoupons < ActiveRecord::Migration[5.1]
  def change
    add_column :coupons, :no_of_uses, :integer
  end
end
