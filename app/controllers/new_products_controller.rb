class NewProductsController < ApplicationController
  def index
   @cart = current_order

    @new_products = NewProduct.page(params[:page]).per(10) 
  end
end
