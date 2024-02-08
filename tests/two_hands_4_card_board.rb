require_relative '../models/hand'
require_relative '../models/card'

deck = Models::Card.deck
cards = deck.take(8)
deck_without_taken_cards = deck - cards

hero_hand = Models::Hand.new(card_1: cards[0], card_2: cards[1])
villain_hand = Models::Hand.new(card_1: cards[2], card_2: cards[3])
board = cards[4..7]

# result = CombinationCalculator.new(
#   hero_hand: hero_hand,
#   villain_hand: villain_hand,
#   board: board
# )

# p result.calculate
