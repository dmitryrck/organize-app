class Item < ActiveRecord::Base
  attr_accessible :product, :description, :unit, :brand, :transaction_id,
    :quantity, :price

  belongs_to :transaction

  validates :transaction_id, :quantity, :price, :presence => true

  def total
    return unless quantity || price

    quantity * price
  end
end
