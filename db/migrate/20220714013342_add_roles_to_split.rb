class AddRolesToSplit < ActiveRecord::Migration[7.0]
  def change
    add_column :splits, :role, :string
  end
end
