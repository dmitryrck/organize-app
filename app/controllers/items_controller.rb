class ItemsController < ApplicationController
  def create
    Item.create params[:item]
    redirect_to params[:item][:transaction_id]
  end

  def destroy
    item = Item.find(params[:id])
    transaction = item.transaction_id
    item.destroy
    redirect_to transaction_path(transaction)
  end
end
