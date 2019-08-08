class Card
  attr_reader :suit, :number

  NUMBERS = {
    1 => 'ace', 2 => 'deuce', 3 => 'three',
    4 => 'four', 5 => 'five', 6 => 'six',
    7 => 'seven', 8 => 'eight', 9 => 'nine',
    10 => 'ten', 11 => 'jack', 12 => 'queen',
    13 => 'king'
  }

  SUITS = {
    1 => 'clubs',
    2 => 'spades',
    3 => 'diamonds',
    4 => 'hearts'
  }

  def initialize(**args)
    unless SUITS[args[:suit]] && NUMBERS[args[:number]]
      raise "wrong args: #{args.inspect}"
    end
    @suit = args[:suit]
    @number = args[:number]
  end

  def suit_name
    SUITS[suit]
  end

  def number_name
    NUMBERS[number]
  end
end
