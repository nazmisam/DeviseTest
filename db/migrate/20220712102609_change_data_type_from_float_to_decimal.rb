class ChangeDataTypeFromFloatToDecimal < ActiveRecord::Migration[7.0]
  def change
      change_column :splits, :split_percent, :decimal
      change_column :products, :price, :decimal

  end
end
