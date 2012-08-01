class RenameTransactionItemsToItems < ActiveRecord::Migration
  def change
    rename_table :transaction_items, :items
  end
end
