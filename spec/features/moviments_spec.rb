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

  scenario 'search' do
    pending 'waiting to configure travis-ci.org' do
    Moviment.create! :title => 'First', :value => 10
    Moviment.create! :title => 'Secondary', :value => 9

    click_link 'Movimentos'

    fill_in '_moviments_term', :with => 'First'
    click_button 'Pesquisar'

    expect(page).to have_content 'First'
    expect(page).to_not have_content 'Secondary'
    end
  end

  context 'paginate and summary' do
    before do
      Moviment.create :title => 'Moviment#1',
        :value => 10,
        :purchased_at => Date.current
      Moviment.create :title => 'Moviment#2',
        :value => 9,
        :purchased_at => (Date.current - 1.month)
      Moviment.create :title => 'Moviment#3',
        :kind => false,
        :value => 8,
        :purchased_at => (Date.current + 1.month)

      visit '/'
    end

    scenario 'show by default current month' do
      expect(page).to have_content 'Moviment#1'

      expect(page).to have_content 'Despesas R$ 0,00'
      expect(page).to have_content 'Receitas R$ 10,00'
    end

    scenario 'show by default current month' do
      click_link 'Antigos'

      expect(page).to have_content 'Moviment#2'

      expect(page).to have_content 'Despesas R$ 0,00'
      expect(page).to have_content 'Receitas R$ 9,00'
    end

    scenario 'show by default current month' do
      click_link 'Novos'

      expect(page).to have_content 'Moviment#3'

      expect(page).to have_content 'Despesas -R$ 8,00'
      expect(page).to have_content 'Receitas R$ 0,00'
    end
  end

  scenario 'edit' do
    Moviment.create :title => 'Moviment#1',
      :value => 10,
      :purchased_at => Date.current

    visit '/'

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

  scenario 'delete' do
    Moviment.create :title => 'Moviment#1',
      :value => 10

    visit '/'

    click_link 'Moviment#1'
    click_link 'Apagar'

    expect(page).to_not have_content 'Moviment#1'
    expect(page).to_not have_content 'R$ 10,00'
  end

  scenario 'show title' do
    visit '/moviments?year=2012&month=10'

    expect(page).to have_content 'Outubro/2012'
  end
end
