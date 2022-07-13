class RemoveAccountPayFromPayment < ActiveRecord::Migration[7.0]
  def change
    remove_column :payments, :account_pay, :string
  end
end
