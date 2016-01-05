require_relative "player"

class Ai < Player
  def get_next_battle_card
    choices = []
    3.times do
      choices << @deck.get_next_card
    end

    selected = choices.slice! [0,1,2].sample
    choices.each do |leftover_card|
      discard leftover_card
    end

    return selected
  end
end
