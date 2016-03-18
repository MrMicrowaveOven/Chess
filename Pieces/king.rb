class King < SteppingPiece
  def move_dirs
    diag_moves + udlr_moves
  end

  def to_s
    color == 0 ? "  ♔  " : "  ♚  "
  end

end
