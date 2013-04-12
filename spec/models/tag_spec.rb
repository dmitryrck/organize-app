require 'spec_helper'

describe Tag do
  subject do
    Tag.new :name => 'tag#1'
  end

  it { should be_valid }

  it 'return name as to_s' do
    expect(subject.to_s).to eq 'tag#1'
  end

  it 'should not be valid without name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should not be destroyable if has movimentations' do
    Moviment.create :title => 'To tag#1',
      :value => 10.0,
      :tag => subject

    expect { subject.destroy }.to raise_error ActiveRecord::DeleteRestrictionError
  end
end
