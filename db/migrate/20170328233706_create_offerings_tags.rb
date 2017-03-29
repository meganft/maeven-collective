class CreateOfferingsTags < ActiveRecord::Migration[5.0]
  def change
    create_table :offerings_tags do |t|
      t.references :offering, foreign_key: true
      t.references :tag, foreign_key: true
    end
  end
end
