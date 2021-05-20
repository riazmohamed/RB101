# array_of_strings.rb

#  Write out a pseudo code for method that takes an array of strings and returns a string that is all those strings concatenated together.

=begin
keywords: START, SET, GET, PRINT, READ, IF, ELSE IF, ELSE, WHILE, END

------- Informal

# given an array of strings

- create a variable called the result_string and assign the first value of the element within the collection at space 1 to it
- iterator over the array while appending the next value to the result_string seperated by a space.
- when the program reaches the last iteration print the result_string and exit the program

---------- Formal Pseudo code

START
# Given an array of strings

SET iterator = 1
SET result_string = value within the collection at space 1 "iterator"
SET length = length of the iterator

WHILE length <= iterator
  result_string << " " + value within the collection at space (iterator + 1)
  iterator + 1

PRINT result_string

END
=end

def string(arr)
  arr.join(" ")
end

p string(["I", "love", "engineering."])
