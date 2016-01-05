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
    puts "#{player.name} selects "
    cards.each do |card|
      puts "#{card.description}"
    end
    line_break
  end

  def display_playing_card player, card
    puts "#{player.name} plays #{card.description}"
    line_break
  end

  def take_damage player, amount
    puts "#{player.name} takes #{amount} damage"
    line_break
  end

  def line_break
    puts
  end
end
