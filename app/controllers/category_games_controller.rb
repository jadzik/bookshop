#encoding: utf-8
class CategoryGamesController < ApplicationController
  def index
    @category_games = CategoryGame.all 
  end

  def show
    @category_game = CategoryGame.find(params[:id])
    @games = @category_game.games.page(params[:page]).per(10) 
  end
end
