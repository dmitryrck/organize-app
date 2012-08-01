class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :title
      t.text :observation
      t.float :value
      t.date :time

      t.timestamps
    end
  end
end
