module Models
  class Card
    attr_reader :suit, :number

    NUMBERS = {
      1 => 'ace', 2 => 'deuce', 3 => 'three',
      4 => 'four', 5 => 'five', 6 => 'six',
      7 => 'seven', 8 => 'eight', 9 => 'nine',
      10 => 'ten', 11 => 'jack', 12 => 'queen',
      13 => 'king'
    }.freeze

    SUITS = {
      1 => 'clubs',
      2 => 'spades',
      3 => 'diamonds',
      4 => 'hearts'
    }.freeze

    def initialize(**args)
      unless SUITS[args[:suit]] && NUMBERS[args[:number]]
        raise "wrong args: #{args.inspect}"
      end
      @suit = args[:suit]
      @number = args[:number]
    end

    def to_a
      [number, suit]
    end

    def suit_name
      SUITS[suit]
    end

    def number_name
      NUMBERS[number]
    end

    def self.deck
      @deck ||= NUMBERS.keys.flat_map do |number|
        SUITS.keys.map do |suit|
          self.new(suit: suit, number: number)
        end
      end
    end
  end
end
