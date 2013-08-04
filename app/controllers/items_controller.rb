class ItemsController < ApplicationController
  def create
    @item = Item.new(params[:item])
    if @item.save
      flash[:notice] = "Item added!"
      redirect_to @item.order
    else
      flash[:error] = @item.errors.full_messages.join(", ")
      redirect_to order_path(@item.order_id)
    end
  end
end
