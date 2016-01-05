require_relative "deck"
require_relative "input_constants"
require_relative "recipe_book"

class Player
  attr_reader :name, :health, :recipe_book
  def initialize name, ui
    @name = name
    @ui = ui
    @deck = Deck.new
    @health = 20
    @hand_limit = 3
    @hand = []
    @recipe_book = RecipeBook.new
  end

  def add_card card
    @deck.add card
  end

  def get_next_battle_cards
    ready = false
    options = {}

    while @hand.size < @hand_limit
      @hand << @deck.get_next_card
    end
    @hand.each_with_index do |card, index|
      options[index.to_s] = {selected: false, card: card, selector: index}
    end

    while !ready
      options.each_value do |option|
        @ui.display_card_option option
      end
      user_input = @ui.get_input
      if user_input == InputConstants::OK
        selected_options = options.values.select {|opt| opt[:selected]}

        if selected_options.length > 0
          ready = true
        else
          @ui.display "You must choose at least one card to play"
        end
      else
        options[user_input][:selected] = !options[user_input][:selected] if options[user_input]
      end
    end

    return selected_options.collect {|o| o[:card]}
  end

  def discard card
    @hand.delete card
    @deck.discard card
  end

  def alive?
    @health > 0
  end

  def take_damage amount
    @ui.take_damage self, amount
    @health -= amount
  end

  def shuffle_deck
    @deck.shuffle
  end
end

