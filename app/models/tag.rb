class Tag < ActiveRecord::Base
  attr_accessible :name

  has_many :taggables
  has_many :transactions, :through => :taggables

  validates :name, :presence => true
end
