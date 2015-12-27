require_relative "player"
require_relative "attack_card"
require_relative "battle"
class Game
  def initialize
    @player1 = Player.new
    20.times do
      @player1.add_card AttackCard.new
    end

    @player2 = Player.new
    20.times do
      @player2.add_card AttackCard.new
    end
  end

  def start
    battle = Battle.new @player1, @player2
    battle.resolve
  end
end
