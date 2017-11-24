class AddAttachmentImageToBanners < ActiveRecord::Migration[5.0]
  def self.up
    change_table :banners do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :banners, :image
  end
end
