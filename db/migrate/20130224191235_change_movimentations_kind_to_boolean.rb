class ChangeMovimentationsKindToBoolean < ActiveRecord::Migration
  def change
    remove_column :movimentations, :kind

    add_column :movimentations, :kind, :boolean, :default => true

    Movimentation.find_in_batches do |grouped|
      grouped.each do |movimentation|
        if movimentation.value < 0
          movimentation.kind = false
          movimentation.value = movimentation.value * -1
          movimentation.save(:validate => false)
        end
      end
    end
  end
end
