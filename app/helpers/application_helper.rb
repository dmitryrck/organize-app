module ApplicationHelper
  def period_url period
    year, month = period.to_s.split('-')

    "#{purchases_path}?year=#{year}&month=#{month}"
  end
end
