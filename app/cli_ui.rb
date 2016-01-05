class CliUi
  def display msg
    puts msg
  end

  def get_input
    gets.chomp.downcase
  end

  def display_card_option option
    output = "#{option[:selector]}) #{option[:card].description}"
    output += " *" if option[:selected]
    puts output
  end

  def display_player player
    puts "#{player.name}: #{player.health}"
  end

  def display_selected_cards player, cards
    card_descriptions = cards.map{|card| card.description}.join ", "
    output = "#{player.name} selects #{card_descriptions}"
    puts output
  end

  def display_playing_card player, card
    puts "#{player.name} plays #{card.description}"
  end

  def line_break
    puts
  end
end
