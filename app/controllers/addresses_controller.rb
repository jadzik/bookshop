#encoding: utf-8
class AddressesController < ApplicationController
  before_filter :my_adresses, :only => [:show, :index, :edit, :destroy]

  def index
   @cart = current_order

    @addresses = current_client.addresses if client_signed_in?
  end

  def new 
   @cart = current_order

    @client = current_client
    @address = @client.addresses.new
  end

  def create
   @cart = current_order

    @client = current_client
    @address = @client.addresses.new(params[:address])
    if @address.save
      redirect_to addresses_path(current_client)
    else
      render :action => "new"
    end
  end

  def edit
   @cart = current_order

    @address = Address.find(params[:id])
    @client = current_client
  end

  def update
   @cart = current_order

    @address = Address.find(params[:id])
    @client = current_client
    if @address.update_attributes(params[:address])
      redirect_to addresses_path(current_client)
    else
      render :action => "edit"
    end
  end

  def destroy
   @cart = current_order

    @address = Address.find(params[:id])
    @client = current_client
    @address.destroy
    redirect_to addresses_path(current_client)
  end

  private
    def my_adresses
      unless (client_signed_in? && current_client.id == params[:id] ) || client_signed_in?
        redirect_to root_path, :error => "Nie możesz zobaczyć adresów innej osoby!"
      end
    end
end
