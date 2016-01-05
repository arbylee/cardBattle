require_relative "ai"
require_relative "cards/punch"
require_relative "cards/slap"
require_relative "cli_ui"
require_relative "battle"
require_relative "player"

class Game
  def initialize
    @ui = CliUi.new
    @player1 = Player.new "Player 1", @ui
    5.times do
      @player1.add_card Punch.new
    end
    5.times do
      @player1.add_card Slap.new
    end

    @player2 = Ai.new "Player 2", @ui
    5.times do
      @player2.add_card Punch.new
    end
    5.times do
      @player2.add_card Slap.new
    end
  end

  def start
    battle = Battle.new @player1, @player2, @ui
    battle.resolve
  end
end

