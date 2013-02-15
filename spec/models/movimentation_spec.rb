require 'spec_helper'

describe Movimentation do
  subject do
    Movimentation.new :title => 'Movimentation#1',
      :value => 1,
      :purchased_at => Date.yesterday
  end

  it { should be_valid }

  it 'return title as to_s' do
    expect(subject.to_s).to eq 'Movimentation#1'
  end

  it 'should not be valid without title' do
    subject.title = nil
    subject.should_not be_valid
  end

  it 'should not be valid without value' do
    subject.value = nil
    subject.should_not be_valid
  end

  it 'should not be valid without purchased_at' do
    subject.purchased_at = nil
    subject.should_not be_valid
  end

  it 'should initialize with date current' do
    described_class.new.purchased_at.should eq Date.current
  end

  context 'validate value' do
    it 'should not be valid with zero as value' do
      subject.value = 0
      subject.should_not be_valid
    end

    it 'should be valid with negative value' do
      subject.value = -10
      subject.should be_valid
    end

    it 'should be valid with positive value' do
      subject.value = 10
      subject.should be_valid
    end
  end

  context 'value localized' do
    it 'accept localized value' do
      lambda { subject.value_localized = '12.345,67' }.should change { subject.value }.to(12_345.67)
    end

    it 'change nothing when is a empty string' do
      subject.value = 10
      lambda { subject.value_localized = '' }.should_not change { subject.value }
    end

    it 'change nothing when is nil' do
      subject.value = 10
      lambda { subject.value_localized = nil }.should_not change { subject.value }
    end
  end

  context 'purchased_at localized' do
    it 'accept localized date' do
      lambda { subject.purchased_at_localized = '31/12/2012' }.should change { subject.purchased_at }.to(Date.new(2012, 12, 31))
    end

    it 'change nothing when is a empty string' do
      subject.purchased_at = Date.current
      lambda { subject.purchased_at_localized = '' }.should_not change { subject.purchased_at }
    end

    it 'change nothing when is nil' do
      subject.purchased_at = Date.current
      lambda { subject.purchased_at_localized = nil }.should_not change { subject.purchased_at }
    end

    it 'dont change when date is invalid'
  end
end
