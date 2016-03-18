def build_queens
  self[7, 3] = Queen.new(0, @board)
  self[0, 3] = Queen.new(1, @board)
end

def build_kings
  self[7, 4] = King.new(0, @board)
  self[0, 4] = King.new(1, @board)
end

def build_rooks
  self[7, 0] = Rook.new(0, @board)
  self[7, 7] = Rook.new(0, @board)
  self[0, 0] = Rook.new(1, @board)
  self[0, 7] = Rook.new(1, @board)
end

def build_knights
  self[7, 1] = Knight.new(0, @board)
  self[7, 6] = Knight.new(0, @board)
  self[0, 1] = Knight.new(1, @board)
  self[0, 6] = Knight.new(1, @board)
end

def build_bishops
  self[7, 2] = Bishop.new(0, @board)
  self[7, 5] = Bishop.new(0, @board)
  self[0, 2] = Bishop.new(1, @board)
  self[0, 5] = Bishop.new(1, @board)
end

def build_pawns
  8.times { |i| self[6,i] = Pawn.new(0, @board) }
  8.times { |i| self[1,i] = Pawn.new(1, @board) }
end
