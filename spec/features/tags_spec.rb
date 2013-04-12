# encoding: utf-8
require 'spec_helper'

describe TagsController do
  before do
    login
  end

  it 'create' do
    visit '/'
    click_link 'Tags'

    within '#container' do
      click_link 'Novo'
    end

    fill_in 'Nome', :with => 'tag#1'

    click_button 'Criar'

    expect(page).to have_content 'tag#1'
    expect(page).to have_content 'Criado por: user@mail.com'
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
    expect(page).to have_content 'Atualizado por: user@mail.com'
  end

  context 'with moviment' do
    it 'show sum and count' do
      tag = Tag.create! :name => 'tag#1'
      Moviment.create! :title => 'Moviment#1',
        :kind => true,
        :value => 10,
        :tag_id => tag.id,
        :purchased_at => Date.current
      Moviment.create! :title => 'Moviment#2',
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

    it 'show moviments' do
      tag = Tag.create! :name => 'tag#1'

      12.times do |number|
        Moviment.create! :title => "Moviment##{number}",
          :value => (2.5 + number),
          :tag_id => tag.id,
          :purchased_at => Date.current
      end

      visit '/'

      click_link 'Tags'
      click_link 'tag#1'

      expect(page).to have_content 'Moviment#11'
      expect(page).to have_content 'R$ 8,50'

      click_link 'Antigos'

      expect(page).to have_content 'Moviment#0'
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
