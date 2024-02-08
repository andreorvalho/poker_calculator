module Engines
  class EquityCalculator
    attr_reader :hero_hand, :villain_hand, :board

    def initialize(**args)
      # allow to receive arrays instead of hands and array of cards
      @hero_hand = hero_hand
      @villain_hand = villain_hand
      @board = board
    end
  end
end
