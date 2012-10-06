class AddIndexToPurchasesTagId < ActiveRecord::Migration
  def change
    add_index :purchases, :tag_id
  end
end
