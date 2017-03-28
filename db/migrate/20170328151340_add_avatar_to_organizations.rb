class AddAvatarToOrganizations < ActiveRecord::Migration[5.0]
  def self.up
    change_table :organizations do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :organizations, :avatar
  end

end
