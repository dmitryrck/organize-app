class AddIndexToPurchasesPurchasedAt < ActiveRecord::Migration
  def change
    add_index :purchases, :purchased_at
  end
end
