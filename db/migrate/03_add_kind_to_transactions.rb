class AddKindToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :kind, :string
  end
end
