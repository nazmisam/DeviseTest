class AddStatusToPayment < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :status, :string, :default => 'Pending'
  end
end
