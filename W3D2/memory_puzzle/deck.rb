require "./card.rb"

class Deck
  VALUES = (:A..:Z).to_a

  attr_reader :size, :values, :deck

  def initialize(size)
    @size = size
    # @deck = Array.new(@size, Deck::VALUES.sample)
    @values = VALUES.sample(@size)
    @deck = @values.map { |value| Card.new(value) } * 2
  end

  def shuffle
    @deck.shuffle
  end
end



# deck1 = Deck.new(3)
# p deck1.deck 
# p deck1.deck.shuffle 
