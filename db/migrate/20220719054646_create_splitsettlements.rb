class CreateSplitsettlements < ActiveRecord::Migration[7.0]
  def change
    create_table :splitsettlements do |t|
      t.string :account_name
      t.integer :product_id
      t.decimal :split_amount
      t.string :product_name
      t.integer :order_number
      t.string :payment_status
      t.integer :transaction_id

      t.timestamps
    end
  end
end
