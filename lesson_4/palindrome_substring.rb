# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

=begin
========== THE PEDAC PROCESS ==========

=====> Problem:
given a string
Input: string`
Output: array of substrings containing palindromes

=====> Rules
Explicit Requiremnts:
  - palindromes are case sensitive

Implicit Requiremnts:
  - same characters can be used in more than one sub string

=====> (Any Questions / Assumptions needing clarification?)
(e.g. return the same string object or an entirely new string???)
  - Can the palindromes overlap? (yes)

=====> Examples, Edge Cases(test rules and boundaries)
# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

=====> Data structure(s):
input: string
Output: array of substring

# substrings(str) logic
# str = "supercalifragilisticexpialidocious"
# split_array = str.split("")
# word_combination_array = (2..split_array.length).map { |letter| split_array.each_cons(letter).map {|arr| arr.join} }.flatten
# word_combination_array

# is_palindrome?(substring) logic
=begin
keywords: START, SET, GET, PRINT, READ, IF, ELSE IF, ELSE, WHILE, END, SUBPROCESS

algorithm :
  - iterate through the collection of substrings
  - at each iteration check if the reverse of the substring is the same the original substring
    - if yes then move it into another collection of substrings who are palindromes

  # Implementation details
  # word_combination_array.select { |word| word == word.reverse }

=end

system('clear')
puts "========================================"

def substrings(str)
  split_array = str.split("")
  word_combination_array = (2..split_array.length)
  .map { |letter| split_array.each_cons(letter)
  .map {|arr| arr.join} }.flatten
  word_combination_array
end

def palindrome_array(substring)
  substring.select { |word| word == word.reverse }.reverse
end

def palindrome_substrings(str)
  substrings_arr = substrings(str)
  palindrome_array(substrings_arr)
end

p palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
p palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome") == []
p palindrome_substrings("") == []

puts "========================================"
