require_relative "../basic_attack_card"

class SuckerPunch < BasicAttackCard
  def initialize
    @priority = 3
    @power = 3
  end

  def name
    "Sucker Punch"
  end
end
