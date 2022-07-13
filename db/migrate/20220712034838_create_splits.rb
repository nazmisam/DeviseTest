class CreateSplits < ActiveRecord::Migration[7.0]
  def change
    create_table :splits do |t|
      t.string :account
      t.integer :split_percent
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
