class AddAccountNameToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :account_name, :string
  end
end
