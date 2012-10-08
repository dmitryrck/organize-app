class AddPurchasesCountToTags < ActiveRecord::Migration
  def change
    add_column :tags, :purchases_count, :integer, :default => 0

    Tag.all.each do |tag|
      tag.update_column :purchases_count, tag.purchases.count
    end
  end
end
