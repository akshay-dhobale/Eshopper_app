class AddColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :twitter_token, :string
  end
end
