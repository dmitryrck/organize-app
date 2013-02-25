class Tag < ActiveRecord::Base
  include OrganizeApp::Locale

  attr_accessible :name

  has_many :movimentations

  validates :name, :presence => true

  scope :ordered, order(:name)

  def movimentations_sum
    movimentations_revenue_sum - movimentations_expense_sum
  end

  def to_s
    name
  end

  private

  def movimentations_expense_sum
    movimentations.expenses.sum(:value)
  end

  def movimentations_revenue_sum
    movimentations.revenues.sum(:value)
  end
end
