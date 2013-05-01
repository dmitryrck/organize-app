# encoding: utf-8
require 'spec_helper'

feature MovimentsController do
  before do
    login
  end

  scenario 'create' do
    visit '/'

    click_link 'Novo Movimento'

    fill_in 'Título', :with => 'Moviment#1'
    fill_in 'Valor', :with => '10,0'

    click_button 'Criar'

    expect(page).to have_content 'Moviment#1'
    expect(page).to have_content 'R$ 10,00'
    expect(page).to have_content I18n.l(Date.current)
    expect(page).to have_content 'Criado por: user@mail.com'
  end

  context 'paginate' do
    before do
      Moviment.create :title => 'Moviment#1',
        :value => 10,
        :purchased_at => Date.current
      Moviment.create :title => 'Moviment#2',
        :value => 10,
        :purchased_at => (Date.current - 1.month)
      Moviment.create :title => 'Moviment#3',
        :value => 10,
        :purchased_at => (Date.current + 1.month)

      visit '/'
    end

    it 'show by default current month' do
      expect(page).to have_content 'Moviment#1'
    end

    it 'show by default current month' do
      click_link 'Antigos'

      expect(page).to have_content 'Moviment#2'
    end

    it 'show by default current month' do
      click_link 'Novos'

      expect(page).to have_content 'Moviment#3'
    end
  end

  it 'edit' do
    Moviment.create :title => 'Moviment#1',
      :value => 10,
      :purchased_at => Date.current

    visit '/'

    page.driver.render 'page.png', :full => true
    click_link 'Moviment#1'
    click_link 'Editar'

    fill_in 'Título', :with => 'Moviment#2'
    fill_in 'Valor', :with => '11,0'
    fill_in 'Data do pagamento', :with => '31/12/2011'

    click_button 'Atualizar'

    expect(page).to have_content 'Moviment#2'
    expect(page).to have_content 'R$ 11,00'
    expect(page).to have_content '31/12/2011'
    expect(page).to have_content 'Atualizado por: user@mail.com'
  end

  it 'delete' do
    Moviment.create :title => 'Moviment#1',
      :value => 10

    visit '/'

    click_link 'Moviment#1'
    click_link 'Apagar'

    expect(page).to_not have_content 'Moviment#1'
    expect(page).to_not have_content 'R$ 10,00'
  end

  it 'show title' do
    visit '/moviments?year=2012&month=10'

    expect(page).to have_content 'Outubro/2012'
  end
end
