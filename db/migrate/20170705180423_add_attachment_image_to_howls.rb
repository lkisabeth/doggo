class AddAttachmentImageToHowls < ActiveRecord::Migration[5.1]
  def self.up
    change_table :howls do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :howls, :image
  end
end
