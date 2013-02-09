#encoding: utf-8
class CategoryGamesController < ApplicationController
  def index
   @cart = current_order

    @category_games = CategoryGame.all 
  end

  def show
   @cart = current_order

    @category_game = CategoryGame.find(params[:id])
    @games = @category_game.games.page(params[:page]).per(10) 
  end
end
