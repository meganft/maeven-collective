class AddSlugToOffering < ActiveRecord::Migration[5.0]
  def change
    add_column :offerings, :slug, :string
  end
end
