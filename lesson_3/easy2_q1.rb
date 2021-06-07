ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.has_key?('Spot')
p ages.include?('Spot')
p ages.member?('Spot')
p ages.any? { |key, value| key == "Spot" }
p ages.fetch("Spot") { |key| "No such key #{key}" }
