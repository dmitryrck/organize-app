class CreateTransactionItems < ActiveRecord::Migration
  def change
    create_table :transaction_items do |t|
      t.integer :transaction_id
      t.string :product
      t.string :description
      t.string :brand
      t.string :unit
      t.float :quantity
      t.float :price
      t.date :purchased_at

      t.timestamps
    end
  end
end
