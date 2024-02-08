class DrawCalculator
  attr_reader :hero_hand, :vilan_hand, :full_board

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

    HERO = 1
    VILLAN = 2
    DRAW = 3

    SOLVERS = {
      HIGH_CARD => 'highest_card',
      ONE_PAIR => 'highest_pair',
      TWO_PAIR => 'two_pair',
    }

  def initialize(**args)
    @hero_hand = args[:hero_hand]
    @vilan_hand = args[:vilan_hand]
    @full_board = args[:full_board]
    @combination = args[:combination]
  end

  def winner
    solver = SOLVERS[@combination]
    send(solver)
  end

  def highest_card
    @winner = nil
    hero_full_board_ordered = order(hero_hand + full_board).last(5)
    vilan_full_board_ordered = order(vilan_hand + full_board).last(5)

    hero_full_board_ordered.size.times do |index|
      if hero_full_board_ordered.last.number > vilan_full_board_ordered.last.number
        @winner = HERO
        break
      elsif hero_full_board_ordered.last.number < vilan_full_board_ordered.last.number
        @winner = VILLAN
        break
      end
    end

    return @winner if @winner.present?
    DRAW
  end

  def highest_pair
    hero_full_board_ordered = order(hero_hand + full_board).last(5)
    vilan_full_board_ordered = order(vilan_hand + full_board).last(5)
    highest_pair_hero = numbers_count(hero_full_board_ordered).key(2)
    highest_vilan_hero = numbers_count(vilan_full_board_ordered).key(2)

    if highest_pair_hero > highest_vilan_hero
      HERO
    elsif highest_vilan_hero > highest_pair_hero
      VILLAN
    else

    end
  end

  def two_pair
    hero_full_board_ordered = order(hero_hand + full_board)
    vilan_full_board_ordered = order(vilan_hand + full_board)
    hero_pairs = numbers_count(hero_full_board_ordered).select { |key, value| value == 2 }.sort_by { |key| key }.keys
    vilan_pairs = numbers_count(vilan_full_board_ordered).select { |key, value| value == 2 }.sort_by { |key| key }.keys
    if hero_pairs.last > vilan_pairs.last
      HERO
    elsif vilan_pairs.last > hero_pairs.last
      VILLAN
    else
      if hero_pairs.first > vilan_pairs.first
        HERO
      elsif vilan_pairs.first > hero_pairs.first
        VILLAN
      else
        hero_full_board_ordered.last(5)
      end
    end
  end

  def order(cards)
    cards.sort { |card1, card2| card1.number <=> card2.number }
  end

  def numbers_count(ordered_cards)
    @numbers_count ||=
      ordered_cards.inject({}) do |new_hash, card|
        new_hash[card.number] ||= 0
        new_hash[card.number] = new_hash[card.number] + 1
        new_hash
      end
  end
end
