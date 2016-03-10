def build_queens
  self[7, 3] = Queen.new(7,3,0)
  self[0, 3] = Queen.new(0,3,1)
end

def build_kings
  self[7, 4] = King.new(7,4,0)
  self[0, 4] = King.new(0,4,1)
end

def build_rooks
  self[7, 0] = Rook.new(7,0,0)
  self[7, 7] = Rook.new(7,7,0)
  self[0, 0] = Rook.new(0,0,1)
  self[0, 7] = Rook.new(0,7,1)
end

def build_knights
  self[7, 1] = Knight.new(7,1,0)
  self[7, 6] = Knight.new(7,6,0)
  self[0, 1] = Knight.new(0,1,1)
  self[0, 6] = Knight.new(0,6,1)
end

def build_bishops
  self[7, 2] = Bishop.new(7,2,0)
  self[7, 5] = Bishop.new(7,5,0)
  self[0, 2] = Bishop.new(0,2,1)
  self[0, 5] = Bishop.new(0,5,1)
end

def build_pawns
  8.times { |i| self[6,i] = Pawn.new(6,i,0) }
  8.times { |i| self[1,i] = Pawn.new(1,i,1) }
end
