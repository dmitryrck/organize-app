class Tag < ActiveRecord::Base
  include OrganizeApp::Locale

  attr_accessible :name

  has_many :movimentations

  validates :name, :presence => true

  scope :ordered, order(:name)

  def movimentations_sum
    movimentations.sum(:value)
  end

  def to_s
    name
  end
end
