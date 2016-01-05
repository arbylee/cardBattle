require_relative "deck"
class Player
  def initialize ui
    @ui = ui
    @deck = Deck.new
    @health = 20
  end

  def add_card card
    @deck.add card
  end

  def get_next_battle_card
    choices = []
    valid_choices = []
    player_choice = nil

    3.times do
      choices << @deck.get_next_card
    end

    while !valid_choices.include? player_choice
      choices.each_with_index do |card, index|
        @ui.display "#{index}) #{card.description}"
        valid_choices << index.to_s
      end
      player_choice = gets.chomp
    end
    selected = choices.slice! player_choice.to_i
    choices.each do |leftover_card|
      discard leftover_card
    end

    return selected
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

