#encoding: utf-8
class CategoryAccessoriesController < ApplicationController
  def index
   @cart = current_order

    @category_accessories = CategoryAccessory.all 
  end

  def show
   @cart = current_order

    @category_accessory = CategoryAccessory.find(params[:id])
    @accessories = @category_accessory.accessories.page(params[:page]).per(10) 
  end
end
