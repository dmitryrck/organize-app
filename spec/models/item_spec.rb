require 'spec_helper'

describe Item do
  subject do
    described_class.new :transaction_id => 1,
      :quantity => 2,
      :price => 6
  end

  it { should be_valid }

  it 'should not be valid without transaction' do
    subject.transaction_id = nil
    subject.should_not be_valid
  end

  it 'should not be valid without quantity' do
    subject.quantity = nil
    subject.should_not be_valid
  end

  it 'should not be valid without price' do
    subject.price = nil
    subject.should_not be_valid
  end

  it 'should return total' do
    subject.total.should eq 12
  end
end
