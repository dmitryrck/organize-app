require 'spec_helper'

describe TransactionsController do
  it 'create transaction' do
    visit '/'

    click_link 'New'

    fill_in 'Title', :with => 'transaction#1'
    fill_in 'Value', :with => '10.0'

    click_button 'Create Transaction'

    page.should have_content 'transaction#1'
    page.should have_content '$10.00'
  end

  it 'edit transaction' do
    pending
    Transaction.create :title => 'transaction#1', :value => 10

    visit '/'

    click_link 'Show'
    click_link 'Edit'

    fill_in 'Title', :with => 'transaction#2'
    fill_in 'Value', :with => '11.0'

    click_button 'Update Transaction'

    page.should have_content 'transaction#2'
    page.should have_content '$11.00'
  end

  it 'delete a transaction' do
    Transaction.create :title => 'transaction#1', :value => 10

    visit '/'

    click_link 'Show'
    click_link 'Destroy'

    page.should_not have_content 'transaction#2'
    page.should_not have_content '$11.00'
  end
end
