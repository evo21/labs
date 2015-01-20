## CLASSIC Tic-Tac-Toe
#require 'pry'
require './tictactoe_board.rb'
require 'set'

class Tictactoe

  def initialize(aboard)
    @board = aboard
  end

  def single_player?
    print 'Choose 1P game: (1) or 2P game: (2) ==> '
    game_choice = gets.chomp
      until game_choice =~ /[1-2]/
        print 'Choose (1) for 1P, or (2) for 2P game.'
        game_choice = gets.chomp
      end
    game_choice == "1" ? true : false
  end
  
  def show_board(board)
    print board_status = """
  
           Input Board                Game Board
    ************************* *************************
          *---*---*---*              *---*---*---*
          | a | b | c |              | #{board["a"]} | #{board["b"]} | #{board["c"]} |
          *---*---*---*              *---*---*---*
          | d | e | f |              | #{board["d"]} | #{board["e"]} | #{board["f"]} |
          *---*---*---*              *---*---*---*
          | g | h | i |              | #{board["g"]} | #{board["h"]} | #{board["i"]} |
          *---*---*---*              *---*---*---*
    """
  end

  def x_turn?(turn_number)
    if turn_number.odd? 
      true
    else 
      false
    end
  end

  def mark_board_x(board, x_move)
    board["#{x_move}"] = 'X'
  end

  def mark_board_o(board, o_move)
    board["#{o_move}"] = 'O'
  end

  def comp_mark_board_o(board, open_spots)
    board["#{open_spots.sample}"] = 'O'
  end

  def horizon_win?(board)
    if (board["a"] == board["b"]) && (board["a"] == board["c"]) ||
     (board["d"] == board["e"]) && (board["d"] == board["f"]) ||
     (board["g"] == board["h"]) && (board["g"] == board["i"])
   return true
    else
      return false
    end
  end

  def vertical_win?(board)
    if (board["a"] == board["d"]) && (board["a"] == board["g"]) ||
     (board["b"] == board["e"]) && (board["b"] == board["h"]) ||
     (board["c"] == board["f"]) && (board["c"] == board["i"])
      return true
    else
      return false
    end
  end

  def diagonal_win?(board)
    if (board["a"] == board["e"]) && (board["a"] == board["i"]) ||
     (board["g"] == board["e"]) && (board["g"] == board["c"])
      return true
    else
      return false
    end
  end

  def take_turn(open_spot)
    print "\n  Where you do want to play? ==>  "
    a_move = gets.chomp.downcase
      until open_spot.include?(a_move)
        puts "***   That move is not allowed!   ***" 
        print "\n  Where you do want to play? ==>  "
        a_move = gets.chomp.downcase     
      end
    a_move
  end

  def play_again?
    print "Would you like to play again?  Y//N? ==> "
    play_again = gets.chomp.downcase
  
    if play_again == "y"
      return true
    else
      return false
    end
  end

  def run
    aboard = Board.new
    ttt = Tictactoe.new(aboard)
    computer_plays = single_player? 
    
    while (aboard.turn_count != 0) do
      system("clear")
      show_board(aboard.board)
  
      if x_turn?(aboard.turn_count)
        next_move = take_turn(aboard.open_spot)
      elsif computer_plays
        next_move = aboard.open_spot.sample
      else next_move = take_turn(aboard.open_spot)
      end

      if x_turn?(aboard.turn_count)
        mark_board_x(aboard.board, next_move)
      elsif computer_plays
        mark_board_o(aboard.board, next_move)
      else
        mark_board_o(aboard.board, next_move)
      end

      aboard.open_spot.delete("#{next_move}")

      system("clear")
      show_board(aboard.board)

      if (diagonal_win?(aboard.board) ||
           horizon_win?(aboard.board) ||
           vertical_win?(aboard.board))
        print "   We have a winner!\n"
        break
      else
        print "   The CAT has the game!\n"
      end

      aboard.turn_count -= 1
    end
  
   if play_again?
      aboard = Board.new
      ttt = Tictactoe.new(aboard)
      ttt.run
    else
      puts "Thanks for playing!"
    end
  end
end

aboard = Board.new
ttt = Tictactoe.new(aboard)
ttt.run

#binding.pry