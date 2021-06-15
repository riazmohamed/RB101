=begin
  A UUID is a type of identifier often used as a way to uniquely identify items...which may not all be created by the same system. That is, without any form of synchronization, two or more separate computer systems can create new items and label them with a UUID with no significant chance of stepping on each other's toes.

  It accomplishes this feat through massive randomization. The number of possible UUID values is approximately 3.4 X 10E38.

  Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.

  It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

  Write a method that returns one UUID when called with no parameters.
=end
#===================================================

=begin
========== THE PEDAC PROCESS ==========

=====> Problem:
Input: call a method may_be "generate_uuid" with no parameters
Output: output a string of UUID joined by a "-" which is 32 characters long excluding the "-"


=====> Rules
Explicit Requiremnts:
  - the output is a hexadecimal string
  - the output is randomised
  - follows the format 8-4-4-4-12

Implicit Requiremnts:


=====> (Any Questions / Assumptions needing clarification?)
(e.g. return the same string object or an entirely new string???)
  - any uppercase or special chareacters? assume no

=====> Examples, Edge Cases(test rules and boundaries)
  - "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91" when invoked the method

=====> Data structure(s):
- within the method body
input: array
Output: string

=====> Algorithm:
 - create an array which has numbers and alphabets as their elements
 - generate random elements from the array until the conditions for the UUID is met.
 - output the string


=====> Optional Implementation (Pseudo-code):
- uuid array has 4 subarrays "uuid_array = [array1, array2, array3, array4]"
- array1 has 8 elements randomly generated - Subprocess
- array2 has 4 elements randomly generated - Subprocess
- array3 has 4 elements randomly generated - Subprocess
- array4 has 12 elements randomly generated - Subprocess
=end

# code with intent
# my solution
def sub_uuid(length)
  ele_to_choose = (0..9).to_a.chain('a'..'z').to_a
  arr = []
  length.times { arr << ele_to_choose.sample }
  arr.join
end

def generate_uuid
  uuid = [sub_uuid(8), sub_uuid(4), sub_uuid(4), sub_uuid(4), sub_uuid(12)]
  uuid.join("-")
end

p generate_uuid
