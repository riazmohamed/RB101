flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! { |e| e.slice(0..2) }
p flintstones
