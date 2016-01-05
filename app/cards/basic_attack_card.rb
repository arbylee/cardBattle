require_relative "card"

class BasicAttackCard < Card
  attr_reader :power
  def perform user, opponent
    opponent.take_damage power
  end

  def description
    "#{name} (#{power}), Priority: #{priority}"
  end
end

