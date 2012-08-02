require 'spec_helper'

describe ItemsController do
  it 'should add item to transaction' do
    pending
    Transaction.create :title => 'transaction#1', :value => 10

    visit '/'

    click_link 'Show'

    fill_in 'Product', :with => 'product#1'
    fill_in 'Description', :with => 'product about...'
    fill_in 'Brand', :with => 'Brand A'
    fill_in 'Unit', :with => 'Unit'
    fill_in 'Quantity', :with => '2'
    fill_in 'Price', :with => '1.5'

    click_button 'Create Item'

    page.should have_content 'product#1'
    page.should have_content 'product about...'
    page.should have_content 'Brand A'
    page.should have_content 'Unit'
    page.should have_content '2'
    page.should have_content '1.5'
    page.should have_content '3'
  end
end
