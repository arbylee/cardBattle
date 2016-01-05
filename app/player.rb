require_relative "deck"
require_relative "input_constants"

class Player
  def initialize ui
    @ui = ui
    @deck = Deck.new
    @health = 20
    @hand_limit = 3
    @hand = []
  end

  def add_card card
    @deck.add card
  end

  def get_next_battle_cards
    options = {}

    while @hand.size < @hand_limit
      @hand << @deck.get_next_card
    end
    @hand.each_with_index do |card, index|
      options[index.to_s] = {selected: false, card: card, selector: index}
    end

    user_input = nil

    while user_input != InputConstants::OK
      options[user_input][:selected] = !options[user_input][:selected] if options[user_input]

      options.each_value do |option|
        @ui.displayCardOption option
      end
      user_input = @ui.get_input
    end

    selected_options = options.values.select {|opt| opt[:selected]}
    return selected_options.collect {|o| o[:card]}
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

