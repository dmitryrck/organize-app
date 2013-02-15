module ApplicationHelper
  def period_url period
    year, month = period.to_s.split('-')

    "#{movimentations_path}?year=#{year}&month=#{month}"
  end

  def tags_with_link tags=[]
    tags.map { |tag| link_to tag.name, '#' }.to_sentence
  end

  def currency(number)
    formatted = number_to_currency(number)

    if number < 0
      badge = :important
    else
      badge = :info
    end

    "<span class=\"badge badge-#{badge}\">#{formatted}</span>".html_safe
  end
end
