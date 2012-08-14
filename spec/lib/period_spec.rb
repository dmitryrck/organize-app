require 'spec_helper'

describe Period do
  subject do
    described_class.new(2012, 11)
  end

  it 'should respond to year' do
    subject.year.should eq '2012'
  end

  it 'should respond to month' do
    subject.month.should eq '11'
  end

  it 'should store year as string' do
    subject.year = 2012
    subject.year.should eq '2012'
  end

  it 'should return month with two digits' do
    subject.month = 8
    subject.month.should eq '08'
  end

  it 'should fix compare when use ==' do
    other = described_class.new(2012, 11)
    subject.should eq other
  end

  it 'should return to_s as year-month' do
    subject.to_s.should eq '2012-11'
  end

  context 'next' do
    it 'should return next period' do
      next_period = Period.new(2012, 12)
      subject.next.should eq next_period
    end

    it 'should return 1 as next period at end of year' do
      period = Period.new(2012, 12)
      next_period = Period.new(2013, 1)
      period.next.should eq next_period
    end
  end

  context 'previous' do
    it 'should return previous period' do
      subject.previous.should eq Period.new(2012, 10)
    end

    it 'should return 12 as next period at beginging of year' do
      period = Period.new(2012, 1)
      previous_period = Period.new(2011, 12)
      period.previous.should eq previous_period
    end
  end
end
