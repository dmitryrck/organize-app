class Tag < ActiveRecord::Base
  attr_accessible :name

  has_many :purchases

  validates :name, :presence => true

  scope :ordered, order(:name)
end