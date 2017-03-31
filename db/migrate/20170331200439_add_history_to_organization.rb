class AddHistoryToOrganization < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :history, :string
  end
end
