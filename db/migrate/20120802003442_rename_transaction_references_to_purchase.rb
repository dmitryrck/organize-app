class RenameTransactionReferencesToPurchase < ActiveRecord::Migration
  def change
    rename_column :items, :transaction_id, :purchase_id
    rename_column :taggables, :transaction_id, :purchase_id
  end
end
