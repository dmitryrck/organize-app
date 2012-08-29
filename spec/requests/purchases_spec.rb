require 'spec_helper'

describe PurchasesController do
  before do
    login
  end

  it 'create purchase' do
    visit '/'

    click_link 'New Purchase'

    fill_in 'Title', :with => 'purchase#1'
    fill_in 'Value', :with => '10.0'

    click_button 'Create Purchase'

    page.should have_content 'purchase#1'
    page.should have_content '$10.00'
  end

  context 'paginate purchases' do
    before do
      Purchase.create :title => 'purchase#1', :value => 10, :purchased_at => Date.current
      Purchase.create :title => 'purchase#2', :value => 10, :purchased_at => (Date.current - 1.month)
      Purchase.create :title => 'purchase#3', :value => 10, :purchased_at => (Date.current + 1.month)

      visit '/'
    end

    it 'show by default current month' do
      page.should have_content 'purchase#1'
    end

    it 'show by default current month' do
      click_link 'Older'

      page.should have_content 'purchase#2'
    end

    it 'show by default current month' do
      click_link 'Newer'

      page.should have_content 'purchase#3'
    end
  end

  it 'edit purchase' do
    Purchase.create :title => 'purchase#1', :value => 10, :purchased_at => Date.yesterday

    visit '/'

    click_link 'purchase#1'
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

    click_link 'purchase#1'
    click_link 'Destroy'

    page.should_not have_content 'purchase#1'
    page.should_not have_content '$10.00'
  end
end
