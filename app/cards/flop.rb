require_relative "card"

class Flop < Card
  def initialize
    @priority = 5
    @power = 1
  end

  def name
    "Flop"
  end

  def description
    "#{name} (-#{@power}), Priority: #{priority}"
  end

  def perform user, opponent
    user.take_damage @power
  end
end
