require 'spec_helper'

describe MovimentsHelper do
  let :expense do
    Moviment.new(:kind => false, :value => 100)
  end

  let :revenue do
    Moviment.new(:kind => true, :value => 90)
  end

  it 'should return correct expenses sum' do
    expect(expenses_sum([expense, revenue])).to eq -100
  end

  it 'should return correct revenue sum' do
    expect(revenues_sum([expense, revenue])).to eq 90
  end
end
