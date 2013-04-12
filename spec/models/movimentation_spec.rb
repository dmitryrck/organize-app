require 'spec_helper'

describe Moviment do
  subject do
    Moviment.new :title => 'Moviment#1',
      :value => 1,
      :purchased_at => Date.yesterday
  end

  it { should be_valid }

  it 'return title as to_s' do
    expect(subject.to_s).to eq 'Moviment#1'
  end

  it 'should not be valid without title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'should not be valid without value' do
    subject.value = nil
    expect(subject).to_not be_valid
  end

  it 'should not be valid without purchased_at' do
    subject.purchased_at = nil
    expect(subject).to_not be_valid
  end

  it 'should initialize with date current' do
    expect(Moviment.new.purchased_at).to eq Date.current
  end

  context 'validate value' do
    it 'should not be valid with negative value' do
      subject.value = -10
      expect(subject).to_not be_valid
    end

    it 'should be valid with positive value' do
      subject.value = 10
      expect(subject).to be_valid
    end
  end

  context 'value localized' do
    it 'accept localized value' do
      expect { subject.value = '12.345,67' }.to change { subject.value }.to(12_345.67)
    end
  end

  context 'value formatted' do
    context 'return value based on kind' do
      it 'when kind is true' do
        subject.kind = true
        subject.value = 10

        expect(subject.value_formatted).to eq 10
      end

      it 'when kind is false' do
        subject.kind = false
        subject.value = 10

        expect(subject.value_formatted).to eq -10
      end
    end
  end

  context 'purchased_at localized' do
    it 'accept string localized date' do
      expect { subject.purchased_at = '31/12/2012' }.to change { subject.purchased_at }.to(Date.new(2012, 12, 31))
    end

    it 'accept date values' do
      expect { subject.purchased_at = Date.new(2013, 2, 24) }.to change { subject.purchased_at }.to(Date.new(2013, 2, 24))
    end
  end
end
