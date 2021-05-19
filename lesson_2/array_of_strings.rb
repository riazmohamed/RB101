# array_of_strings.rb

#  Write out a pseudo code for method that takes an array of strings and returns a string that is all those strings concatenated together.

=begin
keywords: START, SET, GET, PRINT, READ, IF, ELSE IF, ELSE, WHILE, END

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
