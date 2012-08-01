class RenameTransactionsTimeToPurchasedAt < ActiveRecord::Migration
  def change
    rename_column :transactions, :time, :purchased_at
  end
end
