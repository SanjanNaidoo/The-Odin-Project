# Load the dictionary file into an array of words
file = File.open('./data/google_100.txt')
words = File.readlines(file).map(&:chomp)
file.close()

# Select a random word between 5 and 12 characters long
secret_word = words.select{ |word| word.length.between?(5, 12)}.sample.downcase.chars
puts secret_word.join()
display = Array.new(secret_word.length,'_') 
puts display.join()
incorrect_chars = []

guesses = 6

while true
  print("Enter a guess: ")
  guess = gets.chomp.downcase
  match = false
  # Check if a value is correct, if correct delete from array, if not guesses--
  if secret_word.include?(guess)
    secret_word.each_index do |i|
      if secret_word[i] == guess
        puts secret_word[i]
        puts guess
        match = true
        display[i] = guess
        puts display.join()
      end
    end
    if !match
        incorrect_chars << guess
        guesses -= 1
    end
  end

  if secret_word == display
    puts "Congrats you have won!!!"
    exit!
  elsif guesses == 0
    puts "All guesses have been used. Unlucky! Try again next time."
    exit!
  else
    puts display.join()
    print "Incorrect guesses: #{incorrect_chars}\n"
    print "guesses remaining: #{guesses}\n"
  end
end
