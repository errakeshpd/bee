class GamesController < ApplicationController

  before_action :get_game, only: [:hitme, :flying_bee, :rebuild]
  def index
    @game = Game.new
  end

  def play
    @game = Game.new(game_params)
    if @game.save && @game.build_flying_bee
      redirect_to flying_bee_path(@game)
    else
      redirect_to :back
    end
  end

  def hitme
    @bee = @game.bees.find(params[:bee_id])
    render json: @bee.reduce_life
  end

  def rebuild
    @game.re_build_flying_bee
    render json: true
  end

  def flying_bee

  end

  private
    def game_params
      params.require(:game).permit(:name)
    end

    def get_game
      @game = Game.find(params[:id])
    end
end
