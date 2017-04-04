class AddMaterialsToOfferings < ActiveRecord::Migration[5.0]
  def change
    add_column :offerings, :materials, :string
  end
end
