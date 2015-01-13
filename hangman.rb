## CLASSIC HANGMAN
require 'set'

words = %w(angus beefsteak tomato chocolate gangster unfortunate
           Fargo ASCII drippings dictator capitalist opportunist)

def finished?(turns, guesses, answer)
  turns.zero? || guessed_it?(answer, guesses)
end

def guessed_it?(answer, guesses)
  # returns true if the characters in answer are all in the guesses set
  answer.chars.all? { |letter| guesses.include?(letter) }
end

def greeting(turns)
  puts "Guess my word, and you won't hang the HANGMAN!"
  puts "You have #{turns} turns before he hangs!"
end

def prompt_player
  newguess = $stdin.gets.chomp.upcase
  until newguess =~ /[A-Za-z]/
    print 'You may only guess a Single Letter! Try again ==>  '
    newguess = $stdin.gets.chomp.upcase
  end
  newguess
end

def show_turns(turn_count)
  puts "You now have #{turn_count} guesses left! "
end

def game_status(answer, guesses)
  letters = answer.split('')
  letters.each do |c|
    if guesses.include?(c) # has been guessed
      print c
    else # not guessed
      print '_'
    end

  end
  print '       '
end

def game_over(reveal_word)
  puts 'Oh No!  You have hanged the HANGMAN!'
  puts "My Word was: #{reveal_word}"
end

def hangman(wordlist)
  turn_count = ARGV.empty? ? 6 : ARGV[0].to_i # ARGV passes game turn_count is 6.
  # if no ARGV, default turn_count is 6
  guessed = Set.new # creates a new Set called guessed {}
  answer = wordlist.sample.upcase # answer is random sample string from [wordlist]
  greeting(turn_count)

  until finished?(turn_count, guessed, answer) || guessed_it?(answer, guessed)
    game_status(answer, guessed)
    guess = prompt_player
    guessed.add(guess)
    unless answer.include?(guess)
      turn_count -= 1
      puts "#{guess} is not in My Word"
      show_turns(turn_count)
    end
  end

  if guessed_it?(answer, guessed)
    puts answer
    puts "  You win!! My Word was: #{answer.upcase}"
    puts '  You have saved the HANGMAN!'
  else
    game_over(answer)
  end
end

hangman(words)