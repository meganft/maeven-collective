class CreateOrganization < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :website
      t.string :instagram
      t.string :twitter
      t.string :facebook

      t.timestamps
    end
  end
end
