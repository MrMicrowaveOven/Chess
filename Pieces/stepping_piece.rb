class SteppingPiece < Piece
  #Can move into any of its move_dirs, once per turn.
  def move_spots(pos)
    can_move_here = [];
    squares = self.convert_moves_to_squares(pos, self.move_dirs)
    squares.each do |square|
      #you can move there IF that piece isn't occupied by your own color
      can_move_here << square if !@board.is_color_piece?(pos, @color)
    end
    can_move_here
  end
end
