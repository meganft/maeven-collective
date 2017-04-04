class AddPaymentOptionsToOfferings < ActiveRecord::Migration[5.0]
  def change
    add_column :offerings, :payment_options, :string
  end
end
