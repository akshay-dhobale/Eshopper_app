class CreateNewsletterContents < ActiveRecord::Migration[5.1]
  def change
    create_table :newsletter_contents do |t|
      t.string :letter_content

      t.timestamps
    end
  end
end
