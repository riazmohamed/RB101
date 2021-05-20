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

prompt("Welcome to the Calculator!")

prompt("Please enter the first number")
number1 = Kernel.gets().chomp()

prompt("Please enter the second number")
number2 = Kernel.gets().chomp()

prompt("What operation would you like to peform? 1)Add 2)Subtract 3)Multiply 4)Divide")
operator = Kernel.gets().chomp

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

Kernel.puts("The result is #{result}")
