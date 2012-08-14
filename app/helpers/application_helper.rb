module ApplicationHelper
  def period_url period
    year, month = period.to_s.split('-')

    "#{purchases_path}?year=#{year}&month=#{month}"
  end

  def tags_with_link tags=[]
    tags.map { |tag| link_to tag.name, '#' }.to_sentence
  end
end
