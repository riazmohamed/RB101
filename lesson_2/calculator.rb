# calculator

# pseudo code
# ask the user for two numbers
# ask the user for an operation to perform
# output the result

# MORE PSEUDOCODE

=begin
keywords: START, SET, GET, PRINT, READ, IF, ELSE IF, ELSE, WHILE, END, SUBPROCESS

========== casual pseudo code ==========

while ther user wants to keep going
  - ask the user for a collection of numbers
  - iterate through the collection one by one
    - save the first value as the starting value
    - for iteration compare the saved value with the current value
    - if the second value is greater, or it is the save_game
      - move on to the next value in the collection
    - otherwise, if the current value is greater
      - reassign the saved value as the current value

  - after iterating through the collection asve the largest value into the list
  - ask the user if they want to input another collection

return the saved list of numbers

========== formal pseudo code ==========

START

SET large_numbers = []
SET keep_going = true

WHILE keep_going == true
  GET "enter a collection"
  SET collection
  SET largest_number = SUBPROCESS "extract the largest number from that collection"
  large_numbers.push(largest_number)
  GET "enter another collection?"
  IF "yes"
    keep_going == true
  ELSE
    keep_going = false
  IF keep_going == false
    exit the loop

PRINT large_numbers
=end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(number)
  number.to_i != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

name = ''
prompt("Welcome to the Calculator! Enter your name:")

loop do
  name = Kernel.gets().chomp()

  if name.empty?
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  number1 = ""

  loop do
    prompt("Please enter the first number")
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt("Hmmm..... that doesnt look right!")
    end
  end

  number2 = ""
  loop do
    prompt("Please enter the second number")
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt("Hmmm..... that doesnt look right!")
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) Add
    2) Subtract
    3) Multiply
    4) Divide
  MSG

  prompt(operator_prompt)

  operator = ""
  loop do
    operator = Kernel.gets().chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3 or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           else
             number1.to_f() / number2.to_f()
  end

  prompt("The result is #{result}")

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the calculator. Goodbye!")
