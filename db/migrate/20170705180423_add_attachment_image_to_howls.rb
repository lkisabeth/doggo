class AddAttachmentImageToHowls < ActiveRecord::Migration
  def self.up
    change_table :howls do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :howls, :image
  end
end
