class AddExpiresInToMoviments < ActiveRecord::Migration
  def change
    add_column :moviments, :expires_in, :date
  end
end
