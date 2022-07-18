class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.integer :number
      t.string :bank_name
      t.references :split, null: false, foreign_key: true

      t.timestamps
    end
  end
end
