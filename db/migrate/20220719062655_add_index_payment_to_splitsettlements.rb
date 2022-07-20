class AddIndexPaymentToSplitsettlements < ActiveRecord::Migration[7.0]
  def change
    add_reference :splitsettlements, :payment, index: true
    add_column :splitsettlements, :split_percent, :decimal
  end
end
