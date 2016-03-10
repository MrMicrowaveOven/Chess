class Queen < SlidingPiece
  def move_dirs
    possible_dirs = diag_moves + udlr_moves
  end

  def to_s
    color == 0 ? "  ♕  " : "  ♛  "
  end

end
