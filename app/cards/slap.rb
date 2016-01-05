require_relative "basic_attack_card"

class Slap < BasicAttackCard
  def initialize
    @power = 1
  end

  def name
    "Slap"
  end
end

