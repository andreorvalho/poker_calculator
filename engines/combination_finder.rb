require_relative '../models/combinations'

module Engines
  class CombinationFinder
    attr_reader :hero_hand, :villain_hand, :board

    def initialize(hand:, board:)
      # allow to receive arrays instead of hands and array of cards
      @hand = hand
      @board = board
    end

    def best_combination
      STRAIGHT_FLUSH
    end
  end
end
