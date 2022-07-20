class AddAdminIdtoSplit < ActiveRecord::Migration[7.0]
  def change
    add_column :splits, :admin_id, :integer
    add_column :splitsettlements, :admin_id, :integer
  end
end
