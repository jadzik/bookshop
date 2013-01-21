#encoding: utf-8
class OrderItemsController < ApplicationController
  
  def create
    @order = current_order
    @order_item = @order.product_item.build
    @order_item.product = Product.find(params[:product_id])
    
    respond_to do |format|
      if @order_item.save
        format.html { redirect_to @order_item.order,
          notice: 'Dodałeś produkt do koszyka' }
        format.json { render json: @order_item,
          status: :created, location: @order_item }
      else
        format.html {render action: "new"}
        format.json {render json: @order_item.errors,
          status: :unprocessable_entity }
      end
    end
  end


end
