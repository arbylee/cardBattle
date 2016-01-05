require_relative "game"

module Runner
  def self.run
    game = Game.new
    game.start
  end
end
