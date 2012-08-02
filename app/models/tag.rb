class Tag < ActiveRecord::Base
  attr_accessible :name

  has_many :taggables
  has_many :purchases, :through => :taggables

  validates :name, :presence => true
end
