require_relative 'game'

args =
  {
    hero_hand: [1,2]
    vilan_hand: [1,3]
    flop: [1,2,3]
    turn: 2
    river: 3
  }

game = Game.new(**args)

if (game.winner == hero_hand)
  puts 'true'
else
  puts 'false'
end
