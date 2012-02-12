#encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :make_order

    def make_order
      @current_order ||= Order.new
    end

  def add_to_cart
    @order = Order.find(1)#(@current_order.id)
    @item_to_add = Product.find(params[:id])
    if @order.status != "cart" 
      @order = Order.new #można tak?
    end 
    if @order.order_items.blank? 
      redirect_to rules_path#if @item_to_add.resource_type == "Book" || @item_to_add.resource_type == "book" :
      @item = OrderItem.new(:product_id => @item_to_add.id, :price_for_one => @item_to_add.resource.price, :amount => "1",
                           :name_of_product => @item_to_add.resource.title, :order_id => "1")  
      #else 
        #@item = OrderItem.new(:product_id => @item_to_add.id, :price_for_one => @item_to_add.resource.price, :amount => "1", :name_of_product => @item_to_add.resource.name, :order_id => "1") 
      if @item.save 
       redirect_to about_us_path
      #else error???
      end             
    else
    redirect_to root_path            
  end
 end
#  rescue Exception => e
#    flash[:error] =  "Przykro nam, ale wystąpił błąd."
#    redirect_to root_url
#  end
end
