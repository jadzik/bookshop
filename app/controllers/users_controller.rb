#encoding: utf-8
class UsersController < ApplicationController
  before_filter :prepare_params, :only => :create
  before_filter :my_account, :only => :show

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new 
    @user = User.new
    @user.build_client  
  end

  def create
    #ActiveRecord::Base.transaction do
      @user = User.new(@params)
      
    #end
    if @user.save
      @client = @user.create_client(@client_attributes.merge(:resource => @user))
      Rails.logger.info @client.errors.inspect
      Rails.logger.info @user.errors.inspect
      redirect_to user_path(@user)
      #redirect_to root_path
    else
      redirect_to new_user_path(@client)
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
  end

  private
    def prepare_params
      @client_attributes = params[:user].delete(:client_attributes)
      @params = params[:user]
    end
    def my_account
      unless (client_signed_in? && current_client.resource_id == params[:id] ) || client_signed_in?
        redirect_to root_path, :error => "Nie możesz zobaczyć konta innej osoby!"
      end
    end
end
