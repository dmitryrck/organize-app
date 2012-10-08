class AddPurchasesCountToTags < ActiveRecord::Migration
  def change
    add_column :tags, :purchases_count, :integer, :default => 0
  end
end
