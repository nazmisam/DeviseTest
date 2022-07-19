class RemoveProducIdFromSplits < ActiveRecord::Migration[7.0]
  def change
    remove_column :splits, :product_id, :integer
  end
end
