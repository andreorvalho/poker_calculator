Goal:

When given 1 or X hands:

- What are the odds of winning on any given board?

Simplest problem of them all:

1.Given 2 hands and 1 full board, who wins? (two_hands_full_board)
2.Given 2 hands and 1 board missing one card, how many times each one wins? (two_hands_4_card_board)

Models(structures and representations):

1. Card - Object with 2 values: number and suit
2. Hand - 2 cards

Engines(receive structures and return results):

A. Game: Receives X hands and a full board, calculates who is the winner.

B. Combination finder: Receives Y amount of cards and checks for the best possible poker combination of the given cards.

C. Equity calculator: Receives X hands and an imcomplete board, calculates the percentage of times each hand wins on a given board(equity).

D. Tie breaker: Receives X hands and a board, check if the hands are the same combination, which one is bigger than the other

1.
1.1. Calls A with 2 hands(hero and villain) and a full board of 5 cards.
1.2. Since the board is filled up, A calls B for the hero hand with the full board. We get the best hand for the hero hand on that board.
1.3. A also call B for the villain hand with the full board. We get the best hand for the villain hand on that board.
1.4 A Calls D to check if there is a tie and if there is calculates who wins.

