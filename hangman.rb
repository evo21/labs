## CLASSIC HANGMAN
require 'set'

words = ['angus',
         'beefsteak',
         'tomato',
         'chocolate',
         'gangster',
         'unfortunate',
         'Fargo',
         'ASCII',
         'drippings',
         'dictator',
         'capitalist',
         'opportunist']

def finished? (turns, guesses, answer)
  turns.zero? || guessed_it?(answer, guesses)
end

def guessed_it?(answer, guesses)
  # returns true if the characters in answer are all in the guesses set
  answer.chars.all? { |letter| guesses.include?(letter) }
end

def greeting(turns)
  puts "Guess my word, and you won't hang the HANGMAN!"
  puts "You have #{turns} turns before he hangs!"
  # TODO: tell the player about hangman, incl guess the word in x turns
end

def game_status(answer, guesses)
  letters = answer.split("")
  letters.each do |c|
    if guesses.include?(c) # has been guessed
      print c
    else # not guessed
      print '_'
    end

  end
  print "     "
end

def game_over(reveal_word)
  puts "Oh No!  You have hanged the HANGMAN!"
  puts "My Word was: #{reveal_word}"
  # TODO: tell the player what the word was and if they won or lost
end

def prompt_player
  print "Guess a letter in my Word ==> "
  newguess = $stdin.gets.downcase.chomp
  return newguess
  # TODO: get user input / show some status
end

def hangman(wordlist)
  turn_count = ARGV.empty? ? 6 : ARGV[0].to_i
  # if ARGV is empty, then default turn_count is 6.  If ARGV is passed
  # then that number is passed to turn_count.
  
  guessed = Set.new
  # creates a new Set called guessed {}
  
  answer = wordlist.sample(1)[0].downcase
  # answer is string, randomly pulled from words array
  # the zero references the first element in the random sample array
  
  greeting(turn_count) # TODO: Do I need an argument? maybe turncount
  
  until finished?(turn_count, guessed, answer) || guessed_it?(answer, guessed)

    game_status(answer, guessed)

    guess = prompt_player

    guessed.add(guess)
    unless answer.include?(guess)
      turn_count -= 1
      puts "#{guess.upcase} is not in My Word"
    end
  end
  
  if guessed_it?(answer, guessed)
    puts answer
    puts " You win!! My Word was: #{answer.upcase}"
    puts "You have saved the HANGMAN!"
  else
    game_over(answer) # TODO: Do I need an argument?
  end
end

hangman(words)
