# require_relative '../piece'
# can't land on the same square of their own color
# can't go out of bounds
# can't go past piece of the other color
class SlidingPiece < Piece
  #can move many in that direction
  def move
    move_dirs
  end

  def pot_new_moves(single_moves)
    move_place = []
    single_moves.each do |move|
      move_place << [move[0] + pos[0], move[1] + pos[1]]
    end
    move_place
  end

  def udlr_moves
    single_moves = [[0, 1], [0,-1], [1, 0], [-1,0]]
    #A spot in keep_going means we should keep sliding in that direction
    keep_going = []
    #Potentials will convert potential moves to potential positions
    potentials = pot_new_moves(single_moves)
    #Can_move_here is a list of places the piece can move.
    can_move_here = []
    color_of_piece = self.color
    potentials.each do |move|
      row, col = move
      case rows[row][col].color
      when false
        can_move_here << move
        keep_going << [move[0] - pos[0], move[1] - pos[1]]
      when color_of_piece
      when color_of_piece + 1 , color_of_piece - 1
        can_move_here << move
      end
    end
    # (1..7).each do |i|
    #   4.times do |move|
    #     all_moves << [single_moves[move][0]*i, single_moves[move][1]*i]
    #   end
    # end
    can_move_here
  end

  def diag_moves
    [[-1,-1], [-1, 1], [1, -1], [1,  1]]
  end
end
