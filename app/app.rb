require_relative "game"

class Runner
  def self.run
    game = Game.new
    game.start
  end
end

Runner.run
