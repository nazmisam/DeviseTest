class AddAccountNameToPayment < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :account_name, :string
  end
end
