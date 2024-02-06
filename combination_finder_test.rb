require_relative 'combination_finder'
require_relative 'models/hand'
require_relative 'models/card'
require 'fortune'

def correct_combination?(hand, board, combination)
  cards = hand.cards + board
  combination_finder = CombinationFinder.new(cards: cards)

  if (combination_finder.best_combination == combination)
    puts 'true'
  else
    puts 'false'
  end
end

# hand_1 = Models::Hand.new(card_1: [1,1], card_2: [13,1])
# board_1 = [
#   Models::Card.new(number: 12, suit: 1),
#   Models::Card.new(number: 11, suit: 1),
#   Models::Card.new(number: 10, suit: 1),
#   Models::Card.new(number: 4, suit: 4),
#   Models::Card.new(number: 5, suit: 4)
# ]

# correct_combination?(hand_1, board_1, CombinationFinder::STRAIGHT_FLUSH)

# hand_1 = Models::Hand.new(card_1: [1,1], card_2: [1,2])
# board_1 = [
#   Models::Card.new(number: 1, suit: 3),
#   Models::Card.new(number: 1, suit: 4),
#   Models::Card.new(number: 10, suit: 1),
#   Models::Card.new(number: 4, suit: 4),
#   Models::Card.new(number: 5, suit: 4)
# ]

# correct_combination?(hand_1, board_1, CombinationFinder::QUADS)

# hand_1 = Models::Hand.new(card_1: [1,1], card_2: [1,2])
# board_1 = [
#   Models::Card.new(number: 2, suit: 3),
#   Models::Card.new(number: 2, suit: 4),
#   Models::Card.new(number: 2, suit: 1),
#   Models::Card.new(number: 4, suit: 4),
#   Models::Card.new(number: 5, suit: 4)
# ]

# correct_combination?(hand_1, board_1, CombinationFinder::FULL_HOUSE)

# hand_1 = Models::Hand.new(card_1: [1,1], card_2: [3,1])
# board_1 = [
#   Models::Card.new(number: 5, suit: 1),
#   Models::Card.new(number: 7, suit: 1),
#   Models::Card.new(number: 9, suit: 1),
#   Models::Card.new(number: 4, suit: 4),
#   Models::Card.new(number: 5, suit: 4)
# ]

# correct_combination?(hand_1, board_1, CombinationFinder::FLUSH)

# hand_1 = Models::Hand.new(card_1: [4,1], card_2: [5,2])
# board_1 = [
#   Models::Card.new(number: 6, suit: 3),
#   Models::Card.new(number: 7, suit: 1),
#   Models::Card.new(number: 8, suit: 3),
#   Models::Card.new(number: 4, suit: 4),
#   Models::Card.new(number: 5, suit: 4)
# ]

# correct_combination?(hand_1, board_1, CombinationFinder::STRAIGHT)
