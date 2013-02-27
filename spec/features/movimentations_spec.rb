# encoding: utf-8
require 'spec_helper'

feature MovimentationsController do
  before do
    login
  end

  scenario 'create' do
    visit '/'

    click_link 'Novo Movimento'

    fill_in 'Título', :with => 'Movimentation#1'
    fill_in 'Valor', :with => '10,0'

    click_button 'Criar'

    expect(page).to have_content 'Movimentation#1'
    expect(page).to have_content 'R$ 10,00'
    expect(page).to have_content I18n.l(Date.current)
  end

  context 'paginate' do
    before do
      Movimentation.create :title => 'Movimentation#1',
        :value => 10,
        :purchased_at => Date.current
      Movimentation.create :title => 'Movimentation#2',
        :value => 10,
        :purchased_at => (Date.current - 1.month)
      Movimentation.create :title => 'Movimentation#3',
        :value => 10,
        :purchased_at => (Date.current + 1.month)

      visit '/'
    end

    it 'show by default current month' do
      expect(page).to have_content 'Movimentation#1'
    end

    it 'show by default current month' do
      click_link 'Antigos'

      expect(page).to have_content 'Movimentation#2'
    end

    it 'show by default current month' do
      click_link 'Novos'

      expect(page).to have_content 'Movimentation#3'
    end
  end

  it 'edit' do
    Movimentation.create :title => 'Movimentation#1',
      :value => 10,
      :purchased_at => Date.yesterday

    visit '/'

    click_link 'Movimentation#1'
    click_link 'Editar'

    fill_in 'Título', :with => 'Movimentation#2'
    fill_in 'Valor', :with => '11,0'
    fill_in 'Data', :with => '31/12/2011'

    click_button 'Atualizar'

    expect(page).to have_content 'Movimentation#2'
    expect(page).to have_content 'R$ 11,00'
    expect(page).to have_content '31/12/2011'
  end

  it 'delete' do
    Movimentation.create :title => 'Movimentation#1',
      :value => 10

    visit '/'

    click_link 'Movimentation#1'
    click_link 'Apagar'

    expect(page).to_not have_content 'Movimentation#1'
    expect(page).to_not have_content 'R$ 10,00'
  end

  it 'show title' do
    visit '/movimentations?year=2012&month=10'

    expect(page).to have_content 'Outubro/2012'
  end
end
