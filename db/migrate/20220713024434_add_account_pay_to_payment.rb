class AddAccountPayToPayment < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :account_pay, :string
  end
end
