class CombinationFinder
  attr_reader :ordered_cards

  # COMBINATIONS
  STRAIGHT_FLUSH = 9
  QUADS = 8
  FULL_HOUSE = 7
  FLUSH = 6
  STRAIGHT = 5
  TRIO = 4
  TWO_PAIR = 3
  ONE_PAIR = 2
  HIGH_CARD = 1

  def initialize(**args)
    # add code to check if there is no repeated cards
    @ordered_cards = order(args[:cards])
  end

  def best_combination
    if flush?
      if straight?
        return STRAIGHT_FLUSH
      elsif quads?
        return QUADS
      elsif set?
        return pair? ? FULL_HOUSE : FLUSH
      else
        return FLUSH
      end
    end

    return QUADS if quads?

    if set?
      if pair?
        return FULL_HOUSE
      else
        return straight? ? STRAIGHT : SET
      end
    end

    if straight?
      return STRAIGHT
    else
      return TWO_PAIR if two_pair?
      pair? ? ONE_PAIR : HIGH_CARD
    end
  end

  def suits_count
    @suits_count ||=
      ordered_cards.inject({}) do |new_hash, card|
        new_hash[card.suit] ||= 0
        new_hash[card.suit] = new_hash[card.suit] + 1
        new_hash
      end
  end

  def numbers_count
    @numbers_count ||=
      ordered_cards.inject({}) do |new_hash, card|
        new_hash[card.number] ||= 0
        new_hash[card.number] = new_hash[card.number] + 1
        new_hash
      end
  end

  def order(cards)
    cards.sort { |card1, card2| card1.number <=> card2.number }
  end

  def flush?
    suits_count.values.any? { |value| value >= 5 }
  end

  def quads?
    numbers_count.values.any? { |value| value == 4 }
  end

  def straight?
    return true if top_straight?

    # if there is less than 5 different cards than no possibility of straight
    card_numbers = ordered_cards.map(&:number).uniq
    return false if card_numbers.size < 5

    straight = false
    number_of_straights_possible = card_numbers.size - 4

    (number_of_straights_possible).times do |n|
      possible_straight = ordered_cards[n-1..n+3]
      break if straight = check_numbers_folow?(possible_straight)
    end

    return true if straight

    false
  end

  def top_straight?
    ordered_cards.first == 1 && ordered_cards[3..6] == [10,11,12,13]
  end

  def check_numbers_folow?(cards)
    numbers = cards.map(&:number).uniq
    numbers.sort.each_cons(2).all? { |x,y| y == x + 1 }
  end

  def set?
    numbers_count.values.any? { |value| value == 3 }
  end

  def two_pair?
    number_of_pairs = numbers_count.values.select { |value| value == 2 }
    number_of_pairs == 2
  end

  def pair?
    numbers_count.values.any? { |value| value == 2 }
  end
end

