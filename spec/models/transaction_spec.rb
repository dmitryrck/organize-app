require 'spec_helper'

describe Transaction do
  subject do
    described_class.new :title => 'transaction#1',
      :value => 1,
      :purchased_at => Date.yesterday
  end

  it { should be_valid }

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
end
