require 'spec_helper'

describe User do
  subject do
    described_class.new :email => 'user@mail.com',
      :password => 'password'
  end

  it { should be_valid }

  it 'return name as to_s' do
    expect(subject.to_s).to eq 'user@mail.com'
  end
end
