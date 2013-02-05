#encoding: utf-8
class OrdersController < ApplicationController
#  before_filter :my_orders, :only => [:show, :index, :edit]

  def show
    begin
      @order = Order.find(params[:id])
#      @client = @order.client_id
    rescue ActiveRecord::RecordNotFound
      logger.error "Wystąpił błąd koszyka #{params[:id]}"
      redirect_to root_path, notice: 'Wystąpił błąd koszyka. Spróbuj jeszcze raz.'
    end
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

  def destroy
    @order = current_order
    @order.destroy
    session[:cart_id] = nil
    redirect_to root_url, notice: 'Koszyk jest pusty'
  end


#  private
#    def my_orders
#      unless (client_signed_in? && current_client.id == params[:id] ) || client_signed_in?
#        redirect_to root_path, :error => "Nie możesz zobaczyć zamówień innej osoby!"
#      end
#    end
end
