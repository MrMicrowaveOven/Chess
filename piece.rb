class Piece
  attr_reader :pos, :color

#Every piece has a color.
#Its position is stored in Board
#Color is 0 (white), 1 (black), and 2 (empty_piece)
  def initialize(color, board)
    @color = color
    @board = board
  end

#Piece Methods:

#move_dirs will give all the potential "deltas" for each piece.
#--One "square" in each possible direction.
#--Of course, this is based on the specific piece-type
#--These are universal by piece-type.  Doesn't change based on position or surroundings.

#move_spots(pos) will give you all potential moves for that piece, assuming
# it's in the passed position.
# It uses move_dirs to get all possibilities from current position
# -uses "board.in_bounds?(pos)" to eliminate moves that take it off the board.
# -uses board[row,col] to get what's in each potential spot
# --with exception to pawn, this will be the deciding factor of if it can move there.
#sliding pieces will call upon move_dirs_range to extend range
#pawns..... this will get weird.
# THEN use convert_moves_to_squares(pos, moves) to switch from RELATIVE squares to BOARD squares
#-----FINAL RETURN: All squares where the piece can move,

#move_dirs_range (sliding pieces only) will add ranges for each move
#--This only actually affects sliding pieces, other pieces this will
#   simply return the same range.
# if sliding pieces, it will turn each move_spot into a range, checking each spot
#  until it hits a "wall"
# --if it hits another player's piece, the move is inclusive
# adds these to the array of move_spots
# be sure to flatten sliding pieces afterwards

  #Takes a position, and relative moves
  #Returns all the squares on the board where it can go
  def convert_moves_to_squares(pos, moves)
    moves.map { |move| [ move[0] + pos[0], move[1] + pos[1] ] }
  end

  def convert_move_to_square(pos, move)
    return ([ move[0] + pos[0], move[1] + pos[1] ])
  end

  def convert_square_to_move_dir(pos, square)
    return ([square[0] - pos[0], square[1] - pos[1]])
  end

  def udlr_moves
    [[0, 1], [0,-1], [1, 0], [-1,0]]
  end

  def diag_moves
    [[-1,-1], [-1, 1], [1, -1], [1,  1]]
  end

  def move_into_check?(pos)
    check_board = @board.dup
  end

end
