class ChangeDataTypeForSplitPercent < ActiveRecord::Migration[7.0]
  def change

    change_column :splits, :split_percent, :float
  
  end
end
