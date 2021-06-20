require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
FIRST_TO_WIN = 5

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is a #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, punctuation=',', join_word="or")
  if arr.length > 2
    arr[0..-2].join("#{punctuation} ") + " #{join_word} " + "#{arr[-1]}"
  elsif arr.length == 2
    arr.join(" #{join_word} ")
  else
    arr.first
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a position: (#{joinor(empty_squares(brd))})"
    square = gets.chomp.to_i

    break if empty_squares(brd).include?(square)
    prompt "Sorry, thats not a valid choice!"
  end
  brd[square] = PLAYER_MARKER
end

def eminent_threat?(brd, marker)
  result = WINNING_LINES.select do |line|
    brd.values_at(*line).count(marker) == 2 && brd.values_at(*line).include?(INITIAL_MARKER)
  end
  !result.empty?
end

def place_at_winning_square(brd, marker)
  result = WINNING_LINES.select do |line|
    count_player_marker = brd.values_at(*line).count(marker)
    count_player_marker == 2 && brd.values_at(*line).include?(INITIAL_MARKER)
  end

  if !result.empty?
    result.first.each do |place|
      brd[place] = COMPUTER_MARKER if brd[place] == INITIAL_MARKER
    end
  end
end

def computer_places_piece!(brd)
  if eminent_threat?(brd, COMPUTER_MARKER)
    place_at_winning_square(brd, COMPUTER_MARKER)
  elsif eminent_threat?(brd, PLAYER_MARKER)
    place_at_winning_square(brd, PLAYER_MARKER)
  elsif brd[5] == INITIAL_MARKER
    brd[5] = COMPUTER_MARKER
  else
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def grand_champion(player, computer)
  if player > (FIRST_TO_WIN - 1)
    return 'Player'
  elsif computer > (FIRST_TO_WIN - 1)
    return 'Computer'
  end
end

def choose_player!
  ["Player", "Computer"].sample
end

def alternate_player(current_player)
  return "Player" if current_player == "Computer"
  return "Computer" if current_player == "Player"
end

def place_piece!(brd, current_player)
  if current_player == "Player"
    player_places_piece!(brd)
  elsif current_player == "Computer"
    computer_places_piece!(brd)
  end
end

loop do
  player_score = 0
  computer_score = 0
  champ = nil
  current_player = choose_player!

  loop do
    board = initialize_board

    loop do
      display_board(board)
      prompt "Player score :#{player_score}"
      prompt "Computer score :#{computer_score}"

      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
    else
      prompt "It's a tie!"
    end

    sleep(1.5)

    if detect_winner(board) == 'Player'
      player_score += 1
    elsif detect_winner(board) == 'Computer'
      computer_score += 1
    end

    champ = grand_champion(player_score, computer_score)
    if champ
      prompt "The grand champion is the '#{champ}!'"
      break
    end
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe. GoodBye!"
