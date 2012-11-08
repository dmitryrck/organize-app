# encoding: utf-8
require 'spec_helper'

describe PurchasesController do
  before do
    login
  end

  it 'create purchase' do
    visit '/'

    click_link 'Novo'

    fill_in 'Título', :with => 'purchase#1'
    fill_in 'Valor', :with => '10,0'

    click_button 'Criar'

    expect(page).to have_content 'purchase#1'
    expect(page).to have_content 'R$ 10,00'
  end

  context 'paginate purchases' do
    before do
      Purchase.create :title => 'purchase#1', :value => 10, :purchased_at => Date.current
      Purchase.create :title => 'purchase#2', :value => 10, :purchased_at => (Date.current - 1.month)
      Purchase.create :title => 'purchase#3', :value => 10, :purchased_at => (Date.current + 1.month)

      visit '/'
    end

    it 'show by default current month' do
      expect(page).to have_content 'purchase#1'
    end

    it 'show by default current month' do
      click_link 'Antigos'

      expect(page).to have_content 'purchase#2'
    end

    it 'show by default current month' do
      click_link 'Novos'

      expect(page).to have_content 'purchase#3'
    end
  end

  it 'edit purchase' do
    Purchase.create :title => 'purchase#1',
      :value => 10,
      :purchased_at => Date.yesterday

    visit '/'

    click_link 'purchase#1'
    click_link 'Editar'

    fill_in 'Título', :with => 'purchase#2'
    fill_in 'Valor', :with => '11,0'

    click_button 'Atualizar'

    expect(page).to have_content 'purchase#2'
    expect(page).to have_content 'R$ 11,00'
  end

  it 'delete a purchase' do
    Purchase.create :title => 'purchase#1',
      :value => 10

    visit '/'

    click_link 'purchase#1'
    click_link 'Apagar'

    expect(page).to_not have_content 'purchase#1'
    expect(page).to_not have_content '$10.00'
  end

  it 'show title' do
    visit '/purchases?year=2012&month=10'

    expect(page).to have_content 'Outubro/2012'
  end
end
