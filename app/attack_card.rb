class AttackCard
  attr_reader :power

  def initialize
    @power = 2
  end

  def perform user, opponent
    opponent.take_damage power
  end

  def description
    "Attack (#{power})"
  end
end

