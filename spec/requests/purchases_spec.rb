require 'spec_helper'

describe PurchasesController do
  it 'create purchase' do
    visit '/'

    click_link 'New'

    fill_in 'Title', :with => 'purchase#1'
    fill_in 'Value', :with => '10.0'

    click_button 'Create Purchase'

    page.should have_content 'purchase#1'
    page.should have_content '$10.00'
  end

  it 'edit purchase' do
    Purchase.create :title => 'purchase#1', :value => 10, :purchased_at => Date.yesterday

    visit '/'

    click_link 'Show'
    click_link 'Edit'

    fill_in 'Title', :with => 'purchase#2'
    fill_in 'Value', :with => '11.0'

    click_button 'Update Purchase'

    page.should have_content 'purchase#2'
    page.should have_content '$11.00'
  end

  it 'delete a purchase' do
    Purchase.create :title => 'purchase#1', :value => 10

    visit '/'

    click_link 'Show'
    click_link 'Destroy'

    page.should_not have_content 'purchase#2'
    page.should_not have_content '$11.00'
  end
end
