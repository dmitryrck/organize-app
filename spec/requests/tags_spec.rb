# encoding: utf-8
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

  context 'with movimentation' do
    it 'show sum and count' do
      tag = Tag.create! :name => 'tag#1'
      Movimentation.create! :title => 'Movimentation#1',
        :kind => true,
        :value => 10,
        :tag_id => tag.id,
        :purchased_at => Date.current
      Movimentation.create! :title => 'Movimentation#2',
        :kind => false,
        :value => 8,
        :tag_id => tag.id,
        :purchased_at => Date.current

      visit '/'

      click_link 'Tags'
      click_link 'tag#1'

      expect(page).to have_content 'Total: R$ 2,00'
      expect(page).to have_content 'Quantidade de movimentações: 2'
    end

    it 'show movimentations' do
      tag = Tag.create! :name => 'tag#1'

      12.times do |number|
        Movimentation.create! :title => "Movimentation##{number}",
          :value => (2.5 + number),
          :tag_id => tag.id,
          :purchased_at => Date.current
      end

      visit '/'

      click_link 'Tags'
      click_link 'tag#1'

      expect(page).to have_content 'Movimentation#11'
      expect(page).to have_content 'R$ 8,50'

      click_link 'Antigos'

      expect(page).to have_content 'Movimentation#0'
      expect(page).to have_content 'R$ 2,50'

      # FIXME
      # expect(page).to_not have_link 'Antigos'
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
