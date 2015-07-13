class AddAttachmentAvatarToAlbums < ActiveRecord::Migration
  def self.up
    change_table :albums do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :albums, :avatar
  end
end
