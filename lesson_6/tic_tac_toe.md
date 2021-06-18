## Tic Tac Toe

1. Display the initial empty 3x3 board.
2. Ask the user to mark a square.
3. Computer marks a square.
4. Display the updated board state.
5. If winner, display winner.
6. If board is full, display tie.
7. If neither winner nor board is full, go to #2
8. Play again?
9. If yes, go to #1
10. Good bye!

## computer AI: defense
1. computer checks if the the player is going to win and stops the player from winning in the next step
- checks if the player is going to fullfil winning condition
- if nothing to neutralise then pick a square at random
# Algorithm
- during computers play
- computer checks after the player has moved (FIRST_TO_WIN - 1) times
- iterate over the WINNING_LINES and check if both the positions are present within the sub array at any given iteration
  - if present then place the COMPUTER_MARKER in the unfilled position
  - else place the COMPUTER_MARKER randomly in the board
- exit computer play
