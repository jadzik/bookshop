#encoding: utf-8
class GamesController < ApplicationController
  def index
   @cart = current_order

    @games = Game.order("name").page(params[:page]).per(10)
  end

  def show
   @cart = current_order

    @game = Game.find(params[:id])
  end
end
