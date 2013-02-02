#encoding: utf-8
class OrderItemsController < ApplicationController
  
  def new
    @order_item = OrderItem.new
  end

  def create
    @order_item = current_order.product_items.build
    @order_item.product = Product.find(params[:product_id])
    if @order_item.save
      redirect_to @order_item.order, notice: "Dodałeś produkt do koszyka" 
    else
      render action: "new"
    end
  end


end
