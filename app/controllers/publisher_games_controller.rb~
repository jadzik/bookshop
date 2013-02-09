#encoding: utf-8
class PublisherGamesController < ApplicationController
  def index
    @publisher_games = PublisherGame.all 
  end

  def show
    @publisher_game = PublisherGame.find(params[:id])
    @games = @publisher_game.games.page(params[:page]).per(10) 
  end

end
