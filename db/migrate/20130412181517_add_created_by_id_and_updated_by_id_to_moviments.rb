class AddCreatedByIdAndUpdatedByIdToMoviments < ActiveRecord::Migration
  def change
    change_table :moviments do |t|
      t.integer :created_by_id
      t.integer :updated_by_id
    end

    add_index :moviments, :created_by_id
    add_index :moviments, :updated_by_id
  end
end
