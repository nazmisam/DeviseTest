class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :buyer_name
      t.string :buyer_email
      t.string :buyer_address
      t.string :buyer_phone
      t.belongs_to :products, null: false, foreign_key: true

      t.timestamps
    end
  end
end
