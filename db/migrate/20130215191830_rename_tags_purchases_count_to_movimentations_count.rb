class RenameTagsPurchasesCountToMovimentationsCount < ActiveRecord::Migration
  def change
    rename_column :tags, :purchases_count, :movimentations_count
  end
end
