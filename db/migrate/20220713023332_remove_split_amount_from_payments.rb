class RemoveSplitAmountFromPayments < ActiveRecord::Migration[7.0]
  def change
    remove_column :payments, :split_amount, :decimal
  end
end
