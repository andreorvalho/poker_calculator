require_relative 'models/hand'
require_relative 'models/card'
require_relative 'combination_finder'

class CombinationCalculator
  attr_reader :hero_hand, :vilan_hand

  def initialize(**args)
    @hero_hand = Models::Hand.new(**args[:hero_hand])
    @vilan_hand = Models::Hand.new(**args[:vilan_hand])
  end

  def deck_without_hands
    deck = Models::Card.deck
    cards_left = deck - hero_hand.to_a - vilan_hand.to_a
    board = cards_left.take(4)
    cards_left_without_board = cards_left - board

    p "INITIAL"
    p hero_hand.to_a
    p vilan_hand.to_a
    p board
    p "SIMULATION"

    cards_left_without_board.each do |next_card|
      new_board = board + [next_card]
      p 'FULL BOARD'
      p new_board

      hero_cards = (board + hero_hand.to_a).map { |c| Models::Card.new(number: c.first, suit: c.last) }
      villan_cards = (board + vilan_hand.to_a).map { |c| Models::Card.new(number: c.first, suit: c.last) }
      hero_combination_finder = CombinationFinder.new(cards: hero_cards)
      villan_combination_finder = CombinationFinder.new(cards: villan_cards)

      p hero_combination_finder.best_combination
      p villan_combination_finder.best_combination
      if hero_combination_finder.best_combination > villan_combination_finder.best_combination
        p 'HERO'
      elsif hero_combination_finder.best_combination == villan_combination_finder.best_combination
        p 'DRAW'
      else
        p 'VILLAN'
      end
    end

    # cards_left.combination(5).take(100).each do |board|
    #   cards = hero_hand + board
    #   combination_finder = CombinationFinder.new(cards: cards)
    # end
  end
end

combinations = CombinationCalculator.new(
  hero_hand: { card_1: [1,1], card_2: [1,2] },
  vilan_hand: { card_1: [2,1], card_2: [2,2] },
)

combinations.deck_without_hands


