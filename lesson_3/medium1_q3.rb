def factors(number)
  return "Not a valid number" if number <= 0
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors # In ruby the method returns the last evaluated expression
end

p factors(10)
p factors(0)
