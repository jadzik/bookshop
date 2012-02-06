#encoding: utf-8
class CompaniesController < ApplicationController
  before_filter :prepare_params, :only => :create
  before_filter :my_account, :only => :show 

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new 
    @company = Company.new
    @company.build_client
  end

  def create
    ActiveRecord::Base.transaction do
      @company = Company.new(@params)
      @client = @company.create_client(@client_attributes.merge(:resource => @company))
    end
    if @company.save
      redirect_to root_path
    else
      redirect_to new_company_path(@client)
    end
  end

  def edit
  end

  def destroy
  end

  private
    def prepare_params
      @client_attributes = params[:company].delete(:client_attributes)
      @params = params[:company]
    end
    def my_account
      unless (client_signed_in? && current_client.resource_id == params[:id] ) || client_signed_in?
        redirect_to root_path, :error => "Nie możesz zobaczyć konta innej osoby!"
      end
    end
end
