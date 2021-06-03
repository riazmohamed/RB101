# rock_paper_scissors.rb

=begin
things to do
- to keep the score of the players. Best of three wins

implicit requirement
- when it is a draw then no one gets a point

Algorithm
- everytime someone wins the score increments by 1
- return the winner's name when the score reaches 3

=end
VALID_CHOICES = {'r' => "rock", 'p' => "paper", 'sc' => "scissors", 'l' => "lizard", 'sp' => "spock"}

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  logic = {
    'rock' => ['scissors', 'lizard'],
    'paper' => ['rock', 'spock'],
    'scissors' => ['paper', 'lizard'],
    'lizard' => ['spock', 'paper'],
    'spock' => ['rock', 'scissors']
  }

  logic[first].include?(second)

  # (first == 'rock' && second == 'scissors') ||
  #   (first == 'paper' && second == 'rock') ||
  #   (first == 'scissors' && second == 'paper')
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

loop do
  score = { player: 0, computer: 0}
  loop do
    choice = ''
    loop do
      VALID_CHOICES.each {|key, value| puts "Input '#{key}' for '#{value}'"}
      choice = VALID_CHOICES[Kernel.gets().chomp().downcase]

      if VALID_CHOICES.values.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.values.sample

    prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

    display_results(choice, computer_choice)

    # COUNTING THE SCORE and DECLARING THE GRAND WINNER
    score[:player] += 1 if score_count(choice, computer_choice)
    score[:computer] += 1 if score_count(computer_choice, choice)

    puts "Your score:#{score[:player]}, computer score:#{score[:computer]}"

    if score[:player] >= 3 || score[:computer] >= 3
      grand_winner = score.key(score.values.max).to_s
      puts "The grand winner is '#{grand_winner}'!"
      break
    end
  end

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing Good bye!")
