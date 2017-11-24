class CreateConfigurations < ActiveRecord::Migration[5.1]
  def change
    create_table :configurations do |t|
      t.string :conf_key
      t.string :conf_value

      t.timestamps
    end
  end
end
