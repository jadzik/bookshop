#encoding: utf-8
class AccessoriesController < ApplicationController
  def index
   @cart = current_order

    @accessories = Accessory.order("name").page(params[:page]).per(10)
  end

  def show
   @cart = current_order

    @accessory = Accessory.find(params[:id])
  end
end
