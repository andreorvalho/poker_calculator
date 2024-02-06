require 'fortune'

class Game
  attr_reader :hero_hand, :vilan_hand, :flop, :turn, :river

  def initialize(**args)
    @hero_hand = args[:hero_hand]
    @vilan_hand = args[:vilan_hand]
    @flop = args[:flop]
    @turn = args[:turn]
    @river = args[:river]
  end

  def winner
    find_best_hand(
      find_best_combination_hero,
      find_best_combination_vilan
    )
  end

  private

  def find_best_combination_hero
    find_best_combination(hero_hand)
  end

  def find_best_combination_vilan
    find_best_combination(vilan_hand)
  end

  def find_best_combination(hand)
    all_cards = (hand + flop) + [turn, river]
    ordered_cards = order_cards(all_cards)
    find_combination(ordered_cards)
  end

  def best_hand(hero_hand_value, vilan_hand_value)
    if (hero_hand_value > vilan_hand_value)
      hero_hand_value.hand
    elsif (hero_hand_value < vilan_hand_value)
      vilan_hand_value.hand
    else
      best_hand_on_draw(hero_hand_value, vilan_hand_value)
    end
  end

  def best_hand_on_draw(hero_hand_value, vilan_hand_value)

  end

  def find_combination(ordered_cards)

  end
end
