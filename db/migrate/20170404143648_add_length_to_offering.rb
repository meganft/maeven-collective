class AddLengthToOffering < ActiveRecord::Migration[5.0]
  def change
    add_column :offerings, :length, :string
  end
end
