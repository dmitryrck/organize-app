class AddCreatedByIdAndUpdatedByIdToTags < ActiveRecord::Migration
  def change
    change_table :tags do |t|
      t.integer :created_by_id
      t.integer :updated_by_id
    end

    add_index :tags, :created_by_id
    add_index :tags, :updated_by_id
  end
end
