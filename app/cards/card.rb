class Card
  attr_reader :priority
  def description
    "#{name}, Priority: #{priority}"
  end
end
