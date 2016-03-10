class Rook < SlidingPiece
  def move_dirs
    udlr_moves
  end

  def to_s
    color == 0 ? "  ♖  " : "  ♜  "
  end

end
