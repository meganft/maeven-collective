class AddAvatarToOfferings < ActiveRecord::Migration[5.0]
  def self.up
    change_table :offerings do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :offerings, :avatar
  end
end
