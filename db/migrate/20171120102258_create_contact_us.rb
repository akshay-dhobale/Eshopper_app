class CreateContactUs < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_us do |t|
      t.string :name
      t.string :email
      t.string :contact_no
      t.text :message
      t.text :note_admin

      t.timestamps
    end
  end
end
