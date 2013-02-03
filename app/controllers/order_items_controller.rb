#encoding: utf-8
class OrderItemsController < ApplicationController
  
  def new
    @order_item = OrderItem.new
  end

  def create
    @order = current_order
    product = Product.find(params[:product_id])
    @order_item = @order.order_items.build
    @order_item.product = product
    if @order_item.save
      redirect_to @order_item.order, notice: "Dodałeś produkt do koszyka" 
    else
      render action: "new"
    end
  end


end
