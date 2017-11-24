class AddPermissionToAdminUser < ActiveRecord::Migration[5.1]
  def change
    add_column :admin_users, :permission, :boolean
  end
end
