require_relative 'card'

class Hand
  attr_reader :card_1, :card_2

  def initialize(**args)
    @card_1 = Card.new(number: args[:card_1].first, suit: args[:card_1].last)
    @card_2 = Card.new(number: args[:card_2].first, suit: args[:card_2].last)
  end

  def cards
    [card_1, card_2]
  end
end
