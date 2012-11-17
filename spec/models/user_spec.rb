require 'spec_helper'

describe User do
  subject do
    described_class.new :email => 'user@mail.com',
      :password => 'password'
  end

  it { should be_valid }
end
