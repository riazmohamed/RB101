words = "the flintstones rock"
words.gsub!(/(\b\w+?)/) { |letter| letter.upcase }
p words
