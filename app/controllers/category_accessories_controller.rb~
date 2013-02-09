#encoding: utf-8
class CategoryAccessoriesController < ApplicationController
  def index
    @category_accessories = CategoryAccessory.all 
  end

  def show
    @category_accessory = CategoryAccessory.find(params[:id])
    @accessories = @category_accessory.accessories.page(params[:page]).per(10) 
  end
end
