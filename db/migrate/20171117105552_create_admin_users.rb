class CreateAdminUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_users do |t|
      t.string :firstname
      t.string :lastname

      t.timestamps
    end
  end
end
