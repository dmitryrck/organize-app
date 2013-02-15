class RenamePurchasesToMovimentations < ActiveRecord::Migration
  def change
    rename_table :purchases, :movimentations
  end
end
