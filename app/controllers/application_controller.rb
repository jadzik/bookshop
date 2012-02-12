#encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :make_order

    def make_order
      @current_order ||= Order.new
    end
 def add_to_cart
  #@order = Order.find(@current_order.id)
  @item_to_add = Product.find(params[:id])
  #if @order.status != "cart" @order = Order.new
  #if @order.order_items.blank? 
  #  @item_added = OrderItems.new(@item_to_add)   
  #end
  
  redirect_to root_path
  
 end
#  rescue Exception => e
#    flash[:error] =  "Przykro nam, ale wystąpił błąd."
#    redirect_to root_url
#  end
#  rescue_from CanCan::AccessDenied do |exception|  
#    flash[:error] = "Nie masz prawa do wykonania tej akcji!"  
#    redirect_to root_url  
#  end
end
