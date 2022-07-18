class AddARemoveAssociationSplitFromProduct < ActiveRecord::Migration[7.0]
  def change
    remove_index :splits, name: "index_splits_on_product_id"
  end
end
