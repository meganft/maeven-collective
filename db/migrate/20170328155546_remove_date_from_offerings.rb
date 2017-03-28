class RemoveDateFromOfferings < ActiveRecord::Migration[5.0]
  def change
    remove_column :offerings, :date, :string
  end
end
