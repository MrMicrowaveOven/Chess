class Piece
  attr_reader :pos, :color

  def initialize(row, col, color)
    @pos = [row, col]
    @color = color
  end

  # def

  def move_into_check?(pos)
    check_board = @board.dup
  end

end
