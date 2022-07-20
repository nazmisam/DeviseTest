class AddProductIdToSplit < ActiveRecord::Migration[7.0]
  def change
    add_reference :splits, :product, index: true
  end
end
