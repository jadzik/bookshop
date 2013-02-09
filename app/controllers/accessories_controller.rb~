#encoding: utf-8
class AccessoriesController < ApplicationController
  def index
    @accessories = Accessory.order("name").page(params[:page]).per(10)
  end

  def show
    @accessory = Accessory.find(params[:id])
  end
end
