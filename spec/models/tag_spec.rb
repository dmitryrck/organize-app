require 'spec_helper'

describe Tag do
  subject do
    described_class.new :name => 'tag#1'
  end

  it { should be_valid }

  it 'return name as to_s' do
    expect(subject.to_s).to eq 'tag#1'
  end

  it 'should not be valid without name' do
    subject.name = nil
    subject.should_not be_valid
  end
end
