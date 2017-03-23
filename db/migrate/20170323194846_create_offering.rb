class CreateOffering < ActiveRecord::Migration[5.0]
  def change
    create_table :offerings do |t|
      t.string :name
      t.string :date
      t.string :format
      t.string :location
      t.string :price
      t.references :organization
    end
  end
end
