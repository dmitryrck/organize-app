class ItemsController < ApplicationController
  def create
    Item.create params[:item]
    redirect_to params[:item][:purchase_id]
  end

  def destroy
    item = Item.find(params[:id])
    purchase = item.purchase_id
    item.destroy
    redirect_to purchase_path(purchase)
  end
end
