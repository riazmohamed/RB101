require 'pry'
SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
FIRST_TO_WIN = 5

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  values = cards.map { |card| card[1] }

  # rubocop:disable Style/ConditionalAssignment
  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
    end
  end
  # rubocop:enable Style/ConditionalAssignment

  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(cards)
  total(cards) > 21
end

def detect_result(dealer_total, player_total)

  if player_total > 21
    :player_busted
  elsif dealer_total > 21
    :dealer_buster
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_total, player_total)
  result = detect_result(dealer_total, player_total)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins"
  when :tie
    prompt "it's a tie!"
  end
end

def display_grand_winner(dealer_cards, player_cards, dealer_total, player_total)
  puts "==============="
  prompt "Dealer has #{dealer_cards}, for a total of: #{dealer_total}"
  prompt "Player has #{player_cards}, for a total of: #{player_total}"
  display_result(dealer_total, player_total)
end

def play_again?
  puts "----------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def find_champion(player, dealer)
  result = player == FIRST_TO_WIN ? "Player" : "Dealer"
  puts "The overall champion is the #{result}."
end

loop do
  player_score = 0
  dealer_score = 0
  loop do
    system('clear') || system('cls')
    prompt "Welcome to Twenty-One!"

    puts "Player score: #{player_score}"
    puts "Dealer score: #{dealer_score}"

    deck = initialize_deck
    player_cards = []
    dealer_cards = []

    2.times do
      player_cards << deck.pop
      dealer_cards << deck.pop
    end

    player_total = total(player_cards)
    dealer_total = total(dealer_cards)

    prompt "Dealer has #{dealer_cards[0]} and ?"
    # rubocop:disable Layout/LineLength
    prompt "You have: #{player_cards[0]} and #{player_cards[1]}, for a total of #{player_total}."
    # rubocop:enable Layout/LineLength

    loop do
      player_turn = nil
      loop do
        prompt "Would you like to (h)it or (s)tay?"
        player_turn = gets.chomp.downcase
        break if ['h', 's'].include?(player_turn)
        prompt "Sorry, must enter 'h' or 's'."
      end

      if player_turn == 'h'
        player_cards << deck.pop
        prompt "You chose to hit!"
        prompt "You cards are now: #{player_cards}"
        player_total = total(player_cards)
        prompt "Your total is now: #{player_total}"
      end

      break if player_turn == 's' || busted?(player_cards)
    end

    if busted?(player_cards)
      display_grand_winner(dealer_cards, player_cards, dealer_total, player_total)
      sleep(1.5)
      dealer_score += 1
      if player_score == FIRST_TO_WIN || dealer_score == FIRST_TO_WIN
        find_champion(player_score, dealer_score)
        break
      else
        next
      end
      # play_again? ? next : break
    else
      prompt "Dealer stays at #{dealer_total}"
    end

    prompt "Dealer turn..."

    loop do
      break if dealer_total >= 17

      prompt "Dealer hits!"
      dealer_cards << deck.pop
      dealer_total = total(dealer_cards)
      prompt "Dealer's cards are now: #{dealer_cards}"
    end

    if busted?(dealer_cards)
      prompt "Dealer total is now: #{dealer_total}"
      display_grand_winner(dealer_cards, player_cards, dealer_total, player_total)
      sleep(1.5)
      player_score += 1
      if player_score == FIRST_TO_WIN || dealer_score == FIRST_TO_WIN
        find_champion(player_score, dealer_score)
        break
      else
        next
      end
      # play_again? ? next : break
    else
      prompt "Dealer stays at #{dealer_total}"
    end

    display_grand_winner(dealer_cards, player_cards, dealer_total, player_total)
    sleep(1.5)

    if player_score == FIRST_TO_WIN || dealer_score == FIRST_TO_WIN
      find_champion(player_score, dealer_score)
      puts "Player score: #{player_score}"
      puts "Dealer score: #{dealer_score}"
      break
    end

  end
  break unless play_again?
end
# if player_score == 5 || dealer_score == 5
#   find_champion(player_score, dealer_score)
#   break
# end
#
# puts "Player score: #{player_score}"
# puts "Dealer score: #{dealer_score}"

prompt "Thank you for playing Twenty_One! Good bye!"
