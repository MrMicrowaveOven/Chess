# require_relative '../piece'
# Can't land on the same square of their own color
# Can't go out of bounds
# Can't go past piece of the other color
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

  #Where can I move?
  def move_spots(pos, which_dir = nil)
    can_move_here = [];
    ###The 8 directions you can move from that spot.

    squares = self.convert_moves_to_squares(pos, self.move_dirs)
    squares.each do |square|
      #you can move there IF that piece isn't occupied by your own color
          if !@board.is_color_piece?(pos, @color)
            can_move_here << square

            if (@board.is_empty?(pos))
              move_spots(pos, convert_square_to_move_dir(pos, square))
            end
          end
    end
    can_move_here
  end


  # def move_dirs_range
  #   #A spot in keep_going means we should keep sliding in that direction
  #   keep_going = []
  #   #Potentials will convert potential moves to potential positions
  #   potentials = pot_new_moves(single_moves)
  #   #Can_move_here is a list of places the piece can move.
  #   can_move_here = []
  #   color_of_piece = self.color
  #   potentials.each do |move|
  #     row, col = move
  #     case @board[row, col].color
  #     when 2
  #       can_move_here << move
  #       keep_going << [move[0] - pos[0], move[1] - pos[1]]
  #     when color_of_piece
  #     when color_of_piece + 1 , color_of_piece - 1
  #       can_move_here << move
  #     end
  #   end
  #   # (1..7).each do |i|
  #   #   4.times do |move|
  #   #     all_moves << [single_moves[move][0]*i, single_moves[move][1]*i]
  #   #   end
  #   # end
  #   can_move_here
  # end

end
