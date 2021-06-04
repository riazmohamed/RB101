# rock_paper_scissors.rb

VALID_CHOICES = { 'r' => "rock",
                  'p' => "paper",
                  'sc' => "scissors",
                  'l' => "lizard",
                  'sp' => "spock" }

WIN_SCORE = 3

def prompt(message)
  Kernel.puts("=> #{message}")
end

def clear_screen
  system("clear") || system("cls")
end

def welcome_message
  clear_screen
  prompt("Let's play - Rock, Paper, Scissors, Lizard & Spock!")
  sleep 1.5
  clear_screen
  prompt("Best of the three wins!")
  sleep 1.5
end

def get_user_choice
  VALID_CHOICES.each { |key, value| puts "Input '#{key}' for '#{value}'" }
  VALID_CHOICES[Kernel.gets().chomp().downcase]
end

def win?(first, second)
  logic = { 'rock' => ['scissors', 'lizard'],
            'paper' => ['rock', 'spock'],
            'scissors' => ['paper', 'lizard'],
            'lizard' => ['spock', 'paper'],
            'spock' => ['rock', 'scissors'] }

  logic[first].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You win!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("it's a tie!")
  end
end

def score_count(player, computer)
  win?(player, computer)
end

def update_score(score, choice1, choice2)
  if score_count(choice1, choice2)
    score[:player] += 1
  elsif score_count(choice2, choice1)
    score[:computer] += 1
  end
end

def someone_won?(player_score, computer_score)
  player_score >= WIN_SCORE || computer_score >= WIN_SCORE
end

def grand_winner(score)
  score.key(score.values.max).to_s
end

def play_again?
  answer = ''

  loop do
    prompt "Do you want to play again? (y or n)"
    answer = gets.chomp.downcase
    break if ['y', 'yes', 'n', 'no'].include?(answer)
    prompt "Please choose y or n"
  end

  ['y', 'yes'].include?(answer) ? welcome_message : false
end

welcome_message

loop do
  score = { player: 0, computer: 0 }
  loop do
    choice = ''
    loop do
      choice = get_user_choice

      if VALID_CHOICES.values.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.values.sample

    prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

    clear_screen

    display_results(choice, computer_choice)

    update_score(score, choice, computer_choice)

    puts "Your score:#{score[:player]}, computer score:#{score[:computer]}"

    if someone_won?(score[:player], score[:computer])
      puts "The grand winner is '#{grand_winner(score)}'!"
      break
    end
  end

  break unless play_again?
end

prompt("Thank you for playing Good bye!")
