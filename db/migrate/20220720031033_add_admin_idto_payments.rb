class AddAdminIdtoPayments < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :admin_id, :integer
  end
end
