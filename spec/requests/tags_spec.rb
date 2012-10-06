require 'spec_helper'

describe TagsController do
  before do
    login
  end

  it 'create' do
    visit '/'

    click_link 'Tags'
    click_link 'New'

    fill_in 'Name', :with => 'tag#1'

    click_button 'Create Tag'

    page.should have_content 'tag#1'
  end

  it 'edit' do
    Tag.create :name => 'tag#1'

    visit '/'

    click_link 'Tags'
    click_link 'tag#1'
    click_link 'Edit'

    fill_in 'Name', :with => 'tag#2'

    click_button 'Update Tag'

    page.should have_content 'tag#2'
  end

  it 'show sum'

  it 'delete a tag' do
    Tag.create :name => 'tag#1'

    visit '/'
    click_link 'Tags'

    click_link 'tag#1'
    click_link 'Destroy'

    page.should_not have_content 'tag#1'
  end
end
