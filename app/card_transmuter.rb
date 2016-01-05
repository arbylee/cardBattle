class CardTransmuter
  def transmute cards, recipe_book
    if cards.size > 1
      recipe_name = cards.collect {|card| card.name}.sort.join("|")
      card = recipe_book.perform recipe_name
      return card
    end

    return cards[0]
  end
end
