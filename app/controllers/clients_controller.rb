class ClientsController < ApplicationController
  before_filter :my_account, :only => :show 
 def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id])
  end

  def new 
    @client = Client.new
  end

  def create
    @client = Client.new(params[:client])
    if @client.save
      Rails.logger.info @client.errors.inspect
      redirect_to root_path
    else
      render :action => "new"
      #new_client_path(@client)
    end
  end

  def edit
  end

  def destroy
  end

  private
    def my_account
      unless (client_signed_in? && current_client.id == params[:id] ) || client_signed_in?
        redirect_to root_path, :error => "Nie możesz zobaczyć konta innej osoby!"
      end
    end
end
