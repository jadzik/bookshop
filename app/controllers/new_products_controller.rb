class NewProductsController < ApplicationController
  def index
    @new_products = NewProduct.page(params[:page]).per(10) 
  end
end
