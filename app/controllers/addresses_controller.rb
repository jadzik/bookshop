class AddressesController < ApplicationController
  before_filter :prepare_params, :only => :create
  def index
    @addresses = Address.all
  end

  def show
    @address = Address.find(params[:id])
  end

  def new 
    @address = Address.new
  end

  def create
    @address = Address.new(@address_params.merge(:resource => current_client))
    if @address.save
      redirect_to address_path(@address)
    else
      render :action => "new"
    end
  end

  def edit
  end

  def destroy
  end
  private
    def prepare_params
      @address_params = params[:address]
    end
end
