class AddDescriptionToOffering < ActiveRecord::Migration[5.0]
  def change
    add_column :offerings, :description, :string

  end
end
