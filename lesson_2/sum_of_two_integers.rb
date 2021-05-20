# sum_of_two_integers.rb

# write a pseudocode for a method that returns the sum of two integers

=begin
keywords: START, SET, GET, PRINT, READ, IF, ELSE IF, ELSE, WHILE, END

------- Informal
# given value of two integers
- assign the value of the first integer to num1
- assign the value of the second integer to num2
- add the two integers and assign the value returned by them to another variable called 'sum'
- print the value of sum and exit the program

---------- Formal Pseudo code
START

# given two integers

SET integer1 = the first given integer
SET integer2 = the second given integer

SET sum_of_two_integers = integer1 + integer2

PRINT sum_of_two_integers

END

=end

def add(a, b)
  num1 = a
  num2 = b

  sum = num1 + num2
end


p add(1, 3)
