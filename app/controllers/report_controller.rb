class ReportController < ApplicationController
  def show
    @expenses_sum = Moviment.expenses.sum(:value)
    @revenues_sum = Moviment.revenues.sum(:value)
  end
end
