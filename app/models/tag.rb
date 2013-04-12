class Tag < ActiveRecord::Base
  include OrganizeApp::Locale

  belongs_to :created_by, :class_name => 'User'
  belongs_to :updated_by, :class_name => 'User'
  has_many :moviments, :dependent => :restrict_with_exception

  validates :name, :presence => true

  scope :ordered, lambda { order(:name) }

  def moviments_sum
    moviments_revenue_sum - moviments_expense_sum
  end

  def to_s
    name
  end

  private

  def moviments_expense_sum
    moviments.expenses.sum(:value)
  end

  def moviments_revenue_sum
    moviments.revenues.sum(:value)
  end
end
