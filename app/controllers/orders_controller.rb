#encoding: utf-8
class OrdersController < ApplicationController
  before_filter :my_orders, :only => [:show, :index, :edit]

  def add_to_cart
    @order = Order.find(1)#(@current_order.id)
    @item_to_add = Product.find(params[:id])
    if @order.status != "cart" 
      @order = Order.new
    end 
    if @order.order_items.blank? 
      #if @item_to_add.resource_type == "Book" || @item_to_add.resource_type == "book" :
      @item = OrderItem.new(:product_id => @item_to_add.id, :price_for_one => @item_to_add.resource.price,
                              :amount => "1", :name_of_product => "książka", :order_id => "1")  
      #else 
        #@item = OrderItem.new(:product_id => @item_to_add.id, :price_for_one => @item_to_add.resource.price, :amount => "1", :name_of_product => @item_to_add.resource.name, :order_id => "1") 
      if @item.save        
       redirect_to root_path
      #else error???
      end             
    else
      @item = OrderItem.find_by_product_id(@item_to_add.id)
        if @item.blank?
          @item = OrderItem.new(:product_id => @item_to_add.id, :price_for_one => @item_to_add.resource.price, 
                                 :amount => "1", :name_of_product => "książka", :order_id => "1")  
          @item.save
          #if @item.save  
            #redirect somewhere         
          #else error???
          #end  
        #else
          #@item.amount = @item.amount + @item_to_add.amount || order_items.edit(params[:order_item])
          #@item.save
        end
    end
    session[:count] = session[:count] + 1
    redirect_to root_path, :notice => "Dodałeś produkt"
             
  end
 
  
 def index
    @orders = current_client.orders if client_signed_in?
 end

 def show
   @order = Order.find(params[:id])
   @client = @order.client_id
 end

  def new 
    @client = current_client
    @order = @client.orders.new
  end

  def create
    @client = current_client
    @order = @client.orders.new(params[:order])
   # if @order.save
   #   redirect_to orders_path(current_client)
   # else
   #   render :action => "new"
   # end
  end

  private
    def my_orders
      unless (client_signed_in? && current_client.id == params[:id] ) || client_signed_in?
        redirect_to root_path, :error => "Nie możesz zobaczyć zamówień innej osoby!"
      end
    end
end
