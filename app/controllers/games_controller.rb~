#encoding: utf-8
class GamesController < ApplicationController
  def index
    @games = Game.order("name").page(params[:page]).per(10)
  end

  def show
    @game = Game.find(params[:id])
  end
end
