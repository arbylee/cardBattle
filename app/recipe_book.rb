require_relative "cards/flop"
require_relative "cards/combos/sucker_punch"

class RecipeBook
  RECIPES = {
    "Punch|Punch" => SuckerPunch
  }
  RECIPE_PROGRESS = {
    "Punch|Punch" => true
  }
  def perform recipe_name
    if RECIPE_PROGRESS[recipe_name]
      comboClass = RECIPES[recipe_name]
      return comboClass.new
    else
      return Flop.new
    end
  end
end
