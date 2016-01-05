require_relative "basic_attack_card"

class Punch < BasicAttackCard
  def initialize
    @power = 2
  end

  def name
    "Punch"
  end
end

