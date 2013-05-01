# encoding: utf-8
require 'spec_helper'

feature ReportController do
  before do
    login
  end

  scenario 'show report' do
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

    click_link 'Relatório'

    expect(page).to have_content 'Despesas -R$ 8,00'
    expect(page).to have_content 'Receitas R$ 19,00'
    expect(page).to have_content 'Saldo R$ 11,00'
  end
end
