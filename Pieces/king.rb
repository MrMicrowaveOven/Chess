class King < SteppingPiece
  def move_dirs
    possible_dirs = [
      [-1,-1], [-1, 1], [1, -1], [1,  1],
      [0, 1], [0,-1], [1, 0], [-1,0]
    ]
  end

  def to_s
    color == 0 ? "  ♔  " : "  ♚  "
  end

end
