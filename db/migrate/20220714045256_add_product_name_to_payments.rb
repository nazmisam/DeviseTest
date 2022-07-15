class AddProductNameToPayments < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :product_name, :string
  end
end
