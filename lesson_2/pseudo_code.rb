def find_greatest(numbers)
  saved_number = nil

  numbers.each do |num|
    saved_number ||= num

    if saved_number >= num
      next
    else
      saved_number = num
    end
  end
  saved_number
end

p find_greatest([1, 2, 3, 4, 5])
