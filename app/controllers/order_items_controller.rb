#encoding: utf-8
class OrderItemsController < ApplicationController
  
  def new
   @cart = current_order

    @order_item = OrderItem.new
  end

  def create

   @cart = current_order

    @order = current_order
    product = Product.find(params[:product_id])
    @order_item = @order.add_product(product.id, product.resource.price, product.resource.name)
    @order_item.product = product
    respond_to do |f|
      if @order_item.save
        f.html {redirect_to @order_item.order, notice: "Dodałeś produkt do koszyka"}
        f.js
      else
        f.html {redirect_to root_url, notice: "Coś poszło nie tak, nie dodano produktu do koszyka."}
      end
    end
  end


end
