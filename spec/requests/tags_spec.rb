require 'spec_helper'

describe TagsController do
  before do
    login
  end

  it 'create' do
    visit '/'
    click_link 'Tags'
    click_link 'Novo'

    fill_in 'Nome', :with => 'tag#1'

    click_button 'Criar'

    expect(page).to have_content 'tag#1'
  end

  it 'edit' do
    Tag.create :name => 'tag#1'

    visit '/'
    click_link 'Tags'
    click_link 'tag#1'
    click_link 'Editar'

    fill_in 'Nome', :with => 'tag#2'

    click_button 'Atualizar'

    expect(page).to have_content 'tag#2'
  end

  context 'with purchase' do
    it 'show sum' do
      tag = Tag.create! :name => 'tag#1'
      Purchase.create! :title => 'Purchase#1',
        :value => 10,
        :tag_id => tag.id,
        :purchased_at => Date.current
      Purchase.create! :title => 'Purchase#2',
        :value => -8,
        :tag_id => tag.id,
        :purchased_at => Date.current

      visit '/'

      click_link 'Tags'
      click_link 'tag#1'

      expect(page).to have_content 'Total: R$ 2,00'
    end

    it 'show purchases' do
      tag = Tag.create! :name => 'tag#1'

      Purchase.create! :title => 'Purchase#1',
        :value => 10,
        :tag_id => tag.id,
        :purchased_at => Date.current
      Purchase.create! :title => 'Purchase#2',
        :value => -8,
        :tag_id => tag.id,
        :purchased_at => Date.current

      visit '/'

      click_link 'Tags'
      click_link 'tag#1'

      expect(page).to have_content 'Purchase#1'
      expect(page).to have_content 'R$ 10,00'
      expect(page).to have_content 'Purchase#2'
      expect(page).to have_content '-R$ 8,00'
    end
  end

  it 'delete a tag' do
    Tag.create :name => 'tag#1'

    visit '/'
    click_link 'Tags'
    click_link 'tag#1'
    click_link 'Apagar'

    expect(page).to_not have_content 'tag#1'
  end
end
