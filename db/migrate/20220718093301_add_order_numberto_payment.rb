class AddOrderNumbertoPayment < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :order_number, :integer
  end
end
