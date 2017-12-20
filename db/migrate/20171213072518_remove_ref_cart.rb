class RemoveRefCart < ActiveRecord::Migration[5.1]
  def change
  	remove_reference(:carts, :user, index: true, foreign_key: true)
  end
end
