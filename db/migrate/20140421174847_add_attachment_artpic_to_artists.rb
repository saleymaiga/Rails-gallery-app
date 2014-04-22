class AddAttachmentArtpicToArtists < ActiveRecord::Migration
  def self.up
    change_table :artists do |t|
      t.attachment :artpic
    end
  end

  def self.down
    drop_attached_file :artists, :artpic
  end
end
