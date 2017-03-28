class AddDateToOfferings < ActiveRecord::Migration[5.0]
  def change
    add_column :offerings, :date, :datetime

  end
end
