require_relative "card_transmuter"

class Battle
  def initialize player1, player2, ui
    @player1 = player1
    @player2 = player2
    @ui = ui
    @card_transmuter = CardTransmuter.new
  end

  def resolve
    @player1.shuffle_deck
    @player2.shuffle_deck

    while @player1.alive? && @player2.alive?
      @ui.display_player @player1
      @ui.display_player @player2
      @ui.line_break

      player1_selected_cards = @player1.get_next_battle_cards
      player2_selected_cards = @player2.get_next_battle_cards
      @ui.display_selected_cards @player1, player1_selected_cards
      @ui.display_selected_cards @player2, player2_selected_cards
      @ui.line_break

      player1_card = @card_transmuter.transmute player1_selected_cards, @player1.recipe_book
      player2_card = @card_transmuter.transmute player2_selected_cards, @player2.recipe_book
      @ui.line_break

      [
        {card: player1_card, source: @player1, target: @player2},
        {card: player2_card, source: @player2, target: @player1},
      ].sort_by {|player_action| player_action[:card].priority}.reverse!.each do |action|
        @ui.display_playing_card action[:source], action[:card]
        action[:card].perform action[:source], action[:target]
        break if !@player1.alive? || !@player2.alive?
      end
      player1_selected_cards.each {|card| @player1.discard card}
      player2_selected_cards.each {|card| @player2.discard card}
    end

    @ui.display_player @player1
    @ui.display_player @player2
    if !@player1.alive?
      @ui.display "#{@player2.name} wins"
    else
      @ui.display "#{@player1.name} wins"
    end
  end
end
