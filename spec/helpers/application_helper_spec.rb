require 'spec_helper'

describe ApplicationHelper do
  let :period do
    Period.new(2012, 2)
  end

  it 'should return period_url' do
    period_url(period).should eq '/purchases?year=2012&month=02'
  end
end
