class ReAddTotalPayToPayments < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :total_pay, :decimal
  end
end
