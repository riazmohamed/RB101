# pseudo code
=begin
  ------- Informal
  Given a collection of integers

  Iterate through the collection one by one
  - save the first value as a starting value
  - for each iteration compare the saved value with the current value
  - if the saved value is greater, or it is the same
    - move to the next value in collection
  - otherwise, if the current value is greater
    - reassign the saved value as the current value

  After iterating through the collection, return the saved value


  ---------- Formal Pseudo code
  START

  # Given a collection of integers called "numbers"

  SET iterator = 1
  SET saved_number = value within the collection at the space 1

  WHILE iterator <= length of the numbers
    SET current_number = value within the collection at the space "iterator"
    IF saved_number >= current_number
      go to the next iteration
    ELSE
      saved_number = current_number

    iterator = iterator += 1

  PRINT saved_number

  END
=end


def find_greatest(numbers)
  return if numbers.nil?
  saved_number = numbers.first

  numbers.each do |num|
    # saved_number ||= num

    if saved_number >= num
      next
    else
      saved_number = num
    end
  end
  saved_number
end

p find_greatest([1, 2, 3, 4, 5])
