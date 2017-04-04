class AddWebsiteToOfferings < ActiveRecord::Migration[5.0]
  def change
    add_column :offerings, :website, :string
  end
end
