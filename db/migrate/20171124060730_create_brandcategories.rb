class CreateBrandcategories < ActiveRecord::Migration[5.1]
  def change
    create_table :brandcategories do |t|
      t.references :brand, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
