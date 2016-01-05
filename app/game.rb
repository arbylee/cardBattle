require_relative "ai"
require_relative "attack_card"
require_relative "cli_ui"
require_relative "battle"
require_relative "player"
class Game
  def initialize
    @ui = CliUi.new
    @player1 = Player.new @ui
    10.times do
      @player1.add_card AttackCard.new
    end

    @player2 = Ai.new @ui
    10.times do
      @player2.add_card AttackCard.new
    end
  end

  def start
    battle = Battle.new @player1, @player2, @ui
    battle.resolve
  end
end

