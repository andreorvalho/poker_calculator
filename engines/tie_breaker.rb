module Engines
  class TieBreaker
    attr_reader :hero_hand, :villain_hand, :board

    def initialize(hero_hand:, villain_hand:, board:)
      # allow to receive arrays instead of hands and array of cards
      @hero_hand = hero_hand
      @villain_hand = villain_hand
      @board = board
    end

    def winner
      0
    end

    def reasoning
      'highests card on heros hand is an ACE'
    end
  end
end
