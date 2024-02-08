require_relative '../models/hand'
require_relative '../models/card'
require_relative '../engines/game'

deck = Models::Card.deck
cards = deck.take(9)
deck_without_taken_cards = deck - cards

hero_hand = Models::Hand.new(card_1: cards[0], card_2: cards[1])
villain_hand = Models::Hand.new(card_1: cards[2], card_2: cards[3])
board = cards[4..8]

game = Engines::Game.new(
  hero_hand: hero_hand,
  villain_hand: villain_hand,
  board: board
)
result = game.run

p result.winner
p result.best_combination_hero
p result.best_combination_villain
p result.tie_breaker
