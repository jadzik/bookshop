class AddressesController < ApplicationController
  def index
    @addresses = current_client.addresses if client_signed_in?
  end

  def new 
    @client = current_client
    @address = @client.addresses.new
  end

  def create
    @client = current_client
    @address = @client.addresses.new(params[:address])
    if @address.save
      redirect_to addresses_path(current_client)
    else
      render :action => "new"
    end
  end

  def edit
    @address = Address.find(params[:id])
    @client = current_client
  end

  def update
    @address = Address.find(params[:id])
    @client = current_client
    if @address.update_attributes(params[:address])
      redirect_to addresses_path(current_client)
    else
      render :action => "edit"
    end
  end

  def destroy
  end

end
