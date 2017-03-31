class CreateOrganizationsCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations_categories do |t|
      t.references :organization, foreign_key: true
      t.references :category, foreign_key: true
    end
  end
end
