#encoding: utf-8
class SubcategoryGamesController < ApplicationController
 def index
   @cart = current_order

    @subcategory_games = SubcategoryGame.all 
  end

  def show
   @cart = current_order

    @subcategory_game = SubcategoryGame.find(params[:id])
    @games = @subcategory_game.games.page(params[:page]).per(10) 
  end

  def new 
   @cart = current_order

    @subcategory_game = SubcategoryGame.new
  end

  def create
   @cart = current_order

    @subcategory_game = SubcategoryGame.new(params[:subcategory_game])
    if @subcategory_game.save
      redirect_to subcategory_game_path(@subcategory_game)
    else
      render :action => "new"
    end
  end
end
