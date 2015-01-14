require 'set'
require 'pry'

class HangmanGame

  attr_accessor :board, :guesses, :turns, :answer

  def initialize(turns, answer)
    @answer = answer  # get a word when the game begins
    @guesses = Set.new  # initialize the set of guesses
    @turns = turns
  end

  def greeting
    puts "Guess my word, and you won't hang the HANGMAN!"
    puts "You have #{@turns} turns before he hangs!"
  end

  def board
    letters = @answer.split('')
    letters.each do |c|
      if @guesses.include?(c)
        print " #{c} "
      else
        print ' _ '
      end
    end
    print '      '
  end

end


agame = HangmanGame