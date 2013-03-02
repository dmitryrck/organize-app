class Moviment < ActiveRecord::Base
  include OrganizeApp::Locale

  validates :title, :value, :purchased_at, :presence => true
  validates :value, :numericality => { :greater_than_or_equal_to => 0 }

  belongs_to :tag, :counter_cache => true

  after_initialize :set_current_date

  default_scope { order(['purchased_at desc', 'id desc']) }

  scope :by_period, lambda { |period|
    time = Date.new(period.year.to_i, period.month.to_i, 1)

    where('purchased_at >= ? and purchased_at <= ?', time.beginning_of_month, time.end_of_month)
  }

  scope :expenses, lambda { where(:kind => false) }
  scope :revenues, lambda { where(:kind => true) }

  def value_formatted
    if kind?
      value
    else
      value * -1
    end
  end

  def value=(value)
    if value.respond_to?(:gsub)
      value = value.gsub('.', '').gsub(',', '.')
    end

    super
  end

  def purchased_at=(date)
    if date.present? && date.is_a?(String)
      day, month, year = date.split('/').map(&:to_i)

      date = Date.new(year, month, day)
    end

    super
  end

  def to_s
    title
  end

  protected

  def set_current_date
    self.purchased_at ||= Date.current
  end
end
