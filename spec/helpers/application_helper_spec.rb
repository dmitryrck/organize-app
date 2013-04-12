require 'spec_helper'

describe ApplicationHelper do
  let :period do
    Period.new(2012, 2)
  end

  it 'should return period_url' do
    expect(period_url(period)).to eq '/moviments?year=2012&month=02'
  end

  context 'tags link' do
    let :tags do
      [
        double('Tag#1', :name => 'tag1'),
        double('Tag#2', :name => 'tag2')
      ]
    end

    it 'should return tags with link' do
      expect(tags_with_link(tags)).to eq "<a href=\"#\">tag1</a> e <a href=\"#\">tag2</a>"
    end
  end

  context 'currency' do
    it 'greater than zero' do
      expect(currency(10)).to eq "<span class=\"badge badge-info\">R$ 10,00</span>"
    end

    it 'less than zero' do
      expect(currency(-10)).to eq "<span class=\"badge badge-important\">-R$ 10,00</span>"
    end
  end
end
