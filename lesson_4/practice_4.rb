flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

selected_name = flintstones.select { |name| name.start_with?("Be") }
p flintstones.index(selected_name[0])
