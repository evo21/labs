class Board

  attr_accessor :board, :open_spot, :turn_count

  def initialize()
    @board = new_board
    @open_spot = ["a", "b", "c", "d", "e", "f", "g", "h", "i"]
    @turn_count = 9
  end

  def new_board 
    return {"a"=>" ", "b"=> " ", "c"=> ".", "d"=>" ", "e"=>"_", "f"=> " ",
            "g"=>".","h"=>" ","i"=>" "
    }
  end
end