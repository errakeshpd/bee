class GamesController < ApplicationController
  def index
    @game = Game.new
  end

  def play
    @game = Game.new(game_params)
    if @game.save
      redirect_to flying_bee_path(@game)
    else
      redirect_to :back
    end
  end

  def flying_bee
    @game = Game.find(params[:id])
  end

  private
    def game_params
      params.require(:game).permit(:name)
    end
end
