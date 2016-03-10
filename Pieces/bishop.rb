class Bishop < SlidingPiece
  def move_dirs
    diag_moves
  end
  def to_s
    color == 0 ? "  ♗  " : "  ♝  "
  end
end
