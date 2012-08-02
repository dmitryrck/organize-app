class Item < ActiveRecord::Base
  attr_accessible :product, :description, :unit, :brand, :purchase_id,
    :quantity, :price

  belongs_to :purchase

  validates :purchase_id, :quantity, :price, :presence => true

  def total
    return unless quantity || price

    quantity * price
  end
end
