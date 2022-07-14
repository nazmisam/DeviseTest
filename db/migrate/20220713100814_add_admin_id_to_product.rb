class AddAdminIdToProduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :admin, index: true
  end
end
