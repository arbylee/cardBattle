require_relative "cards/combos/sucker_punch"
class CardTransmuter
  RECIPES = {
    "Punch|Punch" => SuckerPunch
  }
  def transmute cards
    if cards.size > 1
      recipe_name = cards.collect {|card| card.name}.sort.join("|")
      comboClass = RECIPES[recipe_name]
      if comboClass
        return comboClass.new
      end
    end

    return cards[0]
  end
end
