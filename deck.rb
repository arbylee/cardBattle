class Deck
  def initialize
    @cards = []
    @discard = []
  end

  def add card
    @cards << card
  end

  def get_next_card
    if @cards.length == 0
      @cards = @discard
      @cards.shuffle
      @discard = []
    end
    @cards.shift
  end

  def discard card
    @discard << card
  end
end

