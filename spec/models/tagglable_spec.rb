require 'spec_helper'

describe Taggable do
  subject do
    described_class.new :tag_id => 1, :purchase_id => 1
  end

  it { should be_valid }

  it 'should not be valid without tag' do
    subject.tag_id = nil
    subject.should_not be_valid
  end

  it 'should not be valid without book' do
    subject.purchase_id = nil
    subject.should_not be_valid
  end
end
