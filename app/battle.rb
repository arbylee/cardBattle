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
      @ui.displayPlayer @player1
      @ui.displayPlayer @player2

      player1_selected_cards = @player1.get_next_battle_cards
      player2_selected_cards = @player2.get_next_battle_cards

      @ui.displaySelectedCards @player1, player1_selected_cards
      @ui.displaySelectedCards @player2, player2_selected_cards

      player1_card = @card_transmuter.transmute player1_selected_cards
      player2_card = @card_transmuter.transmute player2_selected_cards

      @ui.displayPlayingCard @player1, player1_card
      player1_card.perform @player1, @player2
      if !@player2.alive?
        break
      end

      @ui.displayPlayingCard @player2, player2_card
      player2_card.perform @player2, @player1
      if !@player1.alive?
        break
      end

      player1_selected_cards.each {|card| @player1.discard card}
      player2_selected_cards.each {|card| @player2.discard card}
    end

    if @player1.alive?
      @ui.display "#{@player1.name} wins"
    else
      @ui.display "#{@player2.name} wins"
    end
  end
end
