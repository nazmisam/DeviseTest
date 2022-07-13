class AddSplitAmounttoPayment < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :split_amount, :decimal
  end
end
