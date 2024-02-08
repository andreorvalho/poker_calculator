require_relative 'combination_finder'
require_relative 'tie_breaker'

module Engines
  class Game
    attr_reader :hero_hand, :villain_hand, :board

    WINNERS = {
      0 => 'HERO',
      1 => 'VILLAIN'
    }

    Result = Struct.new(:winner, :best_combination_hero, :best_combination_villain, :tie_breaker)

    def initialize(hero_hand:, villain_hand:, board:)
      # allow to receive arrays instead of hands and array of cards
      @hero_hand = hero_hand
      @villain_hand = villain_hand
      @board = board
    end

    def run
      hero_combination_finder = CombinationFinder.new(hand: hero_hand, board: board)
      villain_combination_finder = CombinationFinder.new(hand: villain_hand, board: board)

      if hero_combination_finder.best_combination == villain_combination_finder.best_combination
        tie_breaker = TieBreaker.new(
          hero_hand: hero_hand,
          villain_hand: villain_hand,
          board: board
        )
        Result.new(
          winner: WINNERS[tie_breaker.winner],
          best_combination_hero: hero_combination_finder.best_combination,
          best_combination_villain: villain_combination_finder.best_combination,
          tie_breaker: tie_breaker.reasoning
        )
      elsif hero_combination_finder.best_combination > villain_combination_finder.best_combination
        Result.new(
          winner: WINNERS[0],
          best_combination_hero: hero_combination_finder.best_combination,
          best_combination_villain: villain_combination_finder.best_combination,
          tie_breaker: nil
        )
      else
        Result.new(
          winner: WINNERS[1],
          best_combination_hero: hero_combination_finder.best_combination,
          best_combination_villain: villain_combination_finder.best_combination,
          tie_breaker: nil
        )
      end
    end
  end
end
