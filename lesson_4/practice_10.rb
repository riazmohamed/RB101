munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, data|
  if (0..17).include?(data["age"])
    munsters[name]["age_group"] = "kid"
  elsif (18..64).include?(data["age"])
    munsters[name]["age_group"] = "adult"
  else
    munsters[name]["age_group"] = "senior"
  end
end

munsters.each do |key, value|
  puts "#{key}: #{value}"
end
