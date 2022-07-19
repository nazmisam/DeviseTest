class AddARemoveAssociationSplitFromProduct < ActiveRecord::Migration[7.0]
  def change
    remove_index :splits, column: :product_id, name: "index_splits_on_product_id"
  end
end
