class RenameMovimentationsToMoviments < ActiveRecord::Migration
  def change
    rename_table :movimentations, :moviments
    rename_column :tags, :movimentations_count, :moviments_count
  end
end
