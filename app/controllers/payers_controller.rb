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
    @payer = Payer.new(params[:payer])
    if @payer.save
      redirect_to payer_path(@payer)
    else
      render :action => "new"
    end
  end

  def edit
  end

  def destroy
  end

  private
    def my_adresses
      unless (client_signed_in? && current_client.id == params[:id] ) || client_signed_in?
        redirect_to root_path, :error => "Nie możesz zobaczyć płatników innej osoby!"
      end
    end
end
