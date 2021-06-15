# return an array containing hashes where all the integers are even
# my solution
arr = [{a: [1, 2, 3]},
       {b: [2, 4, 6], c: [3, 6], d: [4]},
       {e: [8], f: [6, 10]}]

result = arr.select do |hash|
          !hash.values.flatten.any? { |e| e.odd? }
        end

p result

# given solution
result = arr.select do |hsh|
  hsh.all? do |_, value|
    value.all? do |num|
      num.even?
    end
  end
end
p result
