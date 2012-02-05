class CompaniesController < ApplicationController
  before_filter :prepare_params, :only => :create
  
  def prepare_params
    @client_attributes = params[:company].delete(:client_attributes)
    @params = params[:company]
  end

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
    @company = Company.new(@params)
    if @company.save
      @client = @company.create_client(@client_attributes.merge(:resource => @company))
      redirect_to root_path
    else
      render :action => "new"
    end
  end

  def edit
  end

  def destroy
  end
end
