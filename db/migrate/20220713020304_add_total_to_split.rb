class AddTotalToSplit < ActiveRecord::Migration[7.0]
  def change
    add_column :splits, :split_total, :decimal
  end
end
