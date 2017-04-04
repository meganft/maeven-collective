class RemoveLengthFromOfferings < ActiveRecord::Migration[5.0]
  def change
    remove_column :offerings, :length, :string

  end
end
