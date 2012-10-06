require 'spec_helper'

describe ApplicationHelper do
  let :period do
    Period.new(2012, 2)
  end

  it 'should return period_url' do
    period_url(period).should eq '/purchases?year=2012&month=02'
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
end
