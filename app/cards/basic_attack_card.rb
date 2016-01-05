require_relative "card"

class BasicAttackCard < Card
  attr_reader :power
  def perform user, opponent
    opponent.take_damage power
  end
end

