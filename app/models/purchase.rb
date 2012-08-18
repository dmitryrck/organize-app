class Purchase < ActiveRecord::Base
  attr_accessible :title, :value, :purchased_at, :tag_id

  validates :title, :value, :purchased_at, :presence => true
  validate :non_zero_value

  belongs_to :tag

  after_initialize :set_current_date

  default_scope order(['purchased_at desc', 'id desc'])

  scope :by_period, lambda { |period|
    time = Date.new(period.year.to_i, period.month.to_i, 1)

    where('purchased_at >= ? and purchased_at <= ?', time.beginning_of_month, time.end_of_month)
  }

  def tag_name
    tag.name if tag
  end

  protected

  def set_current_date
    self.purchased_at ||= Date.current
  end

  def non_zero_value
    return if value.blank?

    errors.add(:value, :invalid) if value.zero?
  end
end