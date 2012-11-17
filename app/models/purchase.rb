class Purchase < ActiveRecord::Base
  include OrganizeApp::Locale

  attr_accessible :title, :purchased_at, :tag_id, :observation, :value,
    :value_localized, :purchased_at_localized

  validates :title, :value, :purchased_at, :presence => true
  validate :non_zero_value

  belongs_to :tag, :counter_cache => true

  after_initialize :set_current_date

  default_scope order(['purchased_at desc', 'id desc'])

  scope :by_period, lambda { |period|
    time = Date.new(period.year.to_i, period.month.to_i, 1)

    where('purchased_at >= ? and purchased_at <= ?', time.beginning_of_month, time.end_of_month)
  }

  def value_localized
    value
  end

  def value_localized=(value)
    unless value.blank?
      self.value = value.gsub('.', '').gsub(',', '.')
    end
  end

  def purchased_at_localized
    purchased_at
  end

  def purchased_at_localized=(date)
    unless date.blank?
      day, month, year = date.split('/').map(&:to_i)

      self.purchased_at = Date.new(year, month, day)
    end
  end

  def to_s
    title
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
