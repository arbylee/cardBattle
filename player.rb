require_relative "deck"
class Player
  def initialize
    @deck = Deck.new
    @health = 20
  end

  def add_card card
    @deck.add card
  end

  def get_next_battle_card
    @deck.get_next_card
  end

  def discard card
    @deck.discard card
  end

  def alive?
    @health > 0
  end

  def take_damage amount
    @health -= amount
  end
end

