arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

result = arr.sort_by do |sub|
  sub.reject { |num| num % 2 == 0 }
end

p result # => [[1, 8, 3], [1, 6, 7], [1, 4, 9]]
