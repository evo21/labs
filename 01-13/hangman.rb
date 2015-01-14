## Classic Hangman.  You may supply the default number of turns by including
## it in the command line passed to the Ruby program, ie. 'ruby hangman 11'

require 'set'

words = %w(angus beefsteak tomato chocolate gangster unfortunate events
           Fargo conservative ASCII drippings dictator capitalist opportunist)

class HangmanGame

  attr_accessor :guesses, :turns, :answer, :guess

  def initialize(answer)
    @turns = ARGV.empty? ? 6 : ARGV[0].to_i
    @answer = answer  # get a word when the game begins
    @guesses = Set.new  # initialize the set of guesses
    @guess = guess
  end

  def greeting
    system ('clear')
    puts "  Guess my word, and you won't hang the HANGMAN!\n
        You have #{@turns} turns before he hangs!\n\n"
  end

def prompt_player
    print "\n\n  Guess a letter in My Word! ==> "
    @guess = $stdin.gets.chomp.upcase
    until @guess =~ /^[A-Za-z]$/
      print '  You may only guess a Single Letter! Try again ==>  '
      @guess = $stdin.gets.chomp.upcase
    end
    @guesses << @guess
  end

  def show_board
    letters = @answer.split('')
    system ('clear')
    letters.each do |c|
      if @guesses.include?(c)
        print " #{c} "
      else
        print ' _ '
      end
    end
    puts '      '
  end

  def guessed_it?
    # returns true if the characters in answer are all in the guesses set
    @answer.chars.all? { |letter| @guesses.include?(letter) }
  end

  def finished?
    @turns.zero? || guessed_it?
  end

  def show_turns
    print "  #{@guess} is not in My Word.\n\n  You now have #{@turns} guesses left! "
  end

  def game_over
    puts "\n  Oh No!  You just hanged the HANGMAN!\n
      My Word was: #{@answer}\n"
  end
end 

while play_again = 'y' do
  agame = HangmanGame.new("#{words.sample.upcase}")

  agame.greeting
  agame.show_board

  until agame.finished?
    agame.prompt_player
    agame.show_board

    unless agame.answer.include?(agame.guess)
      agame.turns -= 1
      agame.show_turns
    end
  end

  if agame.guessed_it?
    puts "\n You win!! My Word was: #{agame.answer}\n\n  
      You have saved the HANGMAN!\n"
  else
    agame.game_over
  end

  print 'Would you like to play again? (Y/N) ==> '
  play_again = gets.chomp.downcase

  until play_again =~ /[ny]/
    print 'Choose (y) to play again, or (n) to quit.'
    play_again = gets.chomp.downcase
  end

  if play_again == "n"
    break
  end
end




