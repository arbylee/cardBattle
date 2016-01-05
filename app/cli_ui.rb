class CliUi
  def display msg
    puts msg
  end

  def get_input
    gets.chomp.downcase
  end

  def displayCardOption option
    output = "#{option[:selector]}) #{option[:card].description}"
    output += " *" if option[:selected]
    puts output
  end

  def displayPlayer player
    puts "#{player.name}: #{player.health}"
  end

  def displaySelectedCards player, cards
    card_descriptions = cards.map{|card| card.description}.join ", "
    output = "#{player.name} selects #{card_descriptions}"
    puts output
  end

  def displayPlayingCard player, card
    puts "#{player.name} plays #{card.description}"
  end
end
