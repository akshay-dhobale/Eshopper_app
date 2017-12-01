class FixColumnName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :products, :short_desciption, :short_description
  end
end
