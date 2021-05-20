# array_of_integers.rb

# write a method that takes an array of integers, and returns a new array with every other element

=begin
keywords: START, SET, GET, PRINT, READ, IF, ELSE IF, ELSE, WHILE, END

START
# Given an array of integers

SET arr = an empty array
SET iterator = 1
SET size = total number of elements with the collection

WHILE iterator < size
  SET current_element = element within the collection at the space "iterator"

  # select only the elements within the collection when the iterator value is odd

  IF iterator % 2 == 0
    next
  ELSE
    arr << current_element

  iterator += 1

PRINT arr

END

=end

# code with intent
given_arr = [1, 2, 3, 4, 5]
p arr = given_arr.select { |e| e.odd?  }
