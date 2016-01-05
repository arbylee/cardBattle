require_relative "card_transmuter"

class Battle
  def initialize player1, player2, ui
    @player1 = player1
    @player2 = player2
    @ui = ui
    @card_transmuter = CardTransmuter.new
  end

  def resolve
    while true
      player1_selected_cards = @player1.get_next_battle_cards
      player2_selected_cards = @player2.get_next_battle_cards

      player1_card = @card_transmuter.transmute player1_selected_cards
      player2_card = @card_transmuter.transmute player2_selected_cards

      player1_card.perform @player1, @player2
      if !@player2.alive?
        break
      end

      player2_card.perform @player2, @player1
      if !@player1.alive?
        break
      end

      player1_selected_cards.each {|card| @player1.discard card}
      player2_selected_cards.each {|card| @player2.discard card}
    end

    if @player1.alive?
      @ui.display "Player 1 wins"
    else
      @ui.display "Player 2 wins"
    end
  end
end
