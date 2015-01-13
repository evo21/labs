## CLASSIC Tic-Tac-Toe

def new_board 
  return {"a"=>" ", "b"=> " ", "c"=> ".", "d"=>" ", "e"=>"_", "f"=> " ",
          "g"=>".","h"=>" ","i"=>" "
  }
end

def new_open_spots
  ["a", "b", "c", "d", "e", "f", "g", "h", "i"]
end

board = new_board()

open_spots = new_open_spots()

def show_board(board)
print board_status = """
  
         Input Board                Game Board
  ************************* *************************
        *---*---*---*              *---*---*---*
        | A | B | C |              | #{board["a"]} | #{board["b"]} | #{board["c"]} |
        *---*---*---*              *---*---*---*
        | D | E | F |              | #{board["d"]} | #{board["e"]} | #{board["f"]} |
        *---*---*---*              *---*---*---*
        | G | H | I |              | #{board["g"]} | #{board["h"]} | #{board["i"]} |
        *---*---*---*              *---*---*---*
  """
end

def move(open_spots)
  print "\n  Where you do want to play? ==>  "
  a_move = gets.chomp.downcase

  until open_spots.include?(a_move)
    puts "***   That move is not allowed!   ***" 
    print "\n  Where you do want to play? ==>  "
    a_move = gets.chomp.downcase     
  end
  
  a_move
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

def play_again?
  print "Would you like to play again?  Y//N? ==> "
  play_again = gets.chomp.downcase
  if play_again == "y"
    return true
  else
    return false
  end
end

# main 

def tictactoe(board, open_spots)

  turn_count = 9

  while (turn_count != 0) do
    system("clear")
    show_board(board)

    next_move = move(open_spots)

      if x_turn?(turn_count)
        mark_board_x(board, next_move)
      else
        mark_board_o(board, next_move)
      end

    open_spots.delete("#{next_move}")

    system("clear")
    show_board(board)

    turn_count -= 1

    if (diagonal_win?(board) || horizon_win?(board) || vertical_win?(board))
      break
    end
  
  end
  
  if (diagonal_win?(board) || horizon_win?(board) || vertical_win?(board))
    print "   We have a winner!\n"

  else 
    print "   The CAT has the game!\n"
  end

end

tictactoe(board, open_spots)

while play_again?
  board = new_board()  #resets the board hash with "empty" new board hash
  open_spots = new_open_spots() #resets available play spots Array w all spots avail.
  tictactoe(board, open_spots)
end
