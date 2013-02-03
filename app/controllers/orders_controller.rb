#encoding: utf-8
class OrdersController < ApplicationController
#  before_filter :my_orders, :only => [:show, :index, :edit]

  def show
    @order = Order.find(params[:id])
#    @client = @order.client_id
  end
 
  def index
    @orders = Order.all
#    @orders = current_client.orders if client_signed_in?
  end

  def new 
    @order = Order.new
#    @client = current_client
#    @order = @client.orders.new
  end

  def create
    @order = Order.new(params[:order])   
#    @client = current_client
#    @order = @client.orders.new(params[:order])
    if @order.save
      redirect_to @order, notice: "Dodałeś produkt do koszyka" 
#      redirect_to orders_path(current_client)
    else
      render action: "new"
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(params[:order])
      redirect_to @order, notice: 'Koszyk został zaktualizowany.' 
    else
      render action: "edit"
    end
  end


#  private
#    def my_orders
#      unless (client_signed_in? && current_client.id == params[:id] ) || client_signed_in?
#        redirect_to root_path, :error => "Nie możesz zobaczyć zamówień innej osoby!"
#      end
#    end
end
