#encoding: utf-8
class PayersController < ApplicationController
  before_filter :my_payers, :only => [:show, :index, :edit]
  def index
    @payers = Payer.all
  end

  def show
    @payer = Payer.find(params[:id])
  end

  def new 
    @payer = Payer.new
  end

  def create
    @payer = Payer.new(params[:payer].merge(:client_id => current_client.id))
    if @payer.save
      redirect_to payers_path(current_client.id)
    else
      render :action => "new"
    end
  end

  def edit
    @payers = Payer.find(params[:id])
    @client = current_client
  end

  def update
    @payer = Payer.find(params[:id])
    @client = current_client
    if @payer.update_attributes(params[:payer])
      redirect_to payers_path(current_client)
    else
      render :action => "edit"
    end
  end

  def destroy
    @payer = Payer.find(params[:id])
    @client = current_client
    @payer.destroy
    redirect_to payers_path(current_client)
  end

  private
    def my_payers
      unless (client_signed_in? && current_client.id == params[:id] ) || client_signed_in?
        redirect_to root_path, :error => "Nie możesz zobaczyć płatników innej osoby!"
      end
    end
end
