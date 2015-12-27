class Battle
  def initialize player1, player2
    @player1 = player1
    @player2 = player2
  end

  def resolve
    while true
      player1_card = @player1.get_next_battle_card
      player2_card = @player2.get_next_battle_card

      player1_card.perform @player1, @player2
      if !@player2.alive?
        break
      end

      player2_card.perform @player2, @player1
      if !@player1.alive?
        break
      end

      @player1.discard player1_card
      @player2.discard player2_card
    end

    if @player1.alive?
      puts "Player 1 wins"
    else
      puts "Player 2 wins"
    end
  end
end
