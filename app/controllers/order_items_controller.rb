#encoding: utf-8
class OrderItemsController < ApplicationController
  
  def new
    @order_item = OrderItem.new
  end

  def create
    @order = current_order
    product = Product.find(params[:product_id])
    if product.resource_type == "Book"
      name = product.resource.title     
    else
      name = product.resource.name
    end
    @order_item = @order.add_product(product.id, product.resource.price, name)
    @order_item.product = product
    if @order_item.save
      redirect_to @order_item.order, notice: "Dodałeś produkt do koszyka" 
    else
      redirect_to root_url, notice: "Coś poszło nie tak, nie dodano produktu do koszyka."
    end
  end


end
