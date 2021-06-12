munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, data|
  case data["age"]
  when 0...18
    data["age_group"] = "kid"
  when 18...65
    data["age_group"] = "adult"
  else
    data["age_group"] = "senior"
  end
end

munsters.each do |key, value|
  puts "#{key}: #{value}"
end
