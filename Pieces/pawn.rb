class Pawn < Piece
  def initialize(color, board)
    @has_moved = false
    super
  end

  def to_s
    color == 0 ? "  ♙  " : "  ♟  "
  end

  def move_dirs(pos)
    if color == 0 && @board[pos[0] - 1, pos[1]].color == 2
      possible_dirs = [[-1, 0]]

      unless @has_moved || @board[pos[0] - 2, pos[1]].color != 2
        possible_dirs << [-2, 0]
      end

      possible_dirs << [-1,-1] if @board[pos[0] - 1, pos[1] - 1].color == 1
      possible_dirs << [-1, 1] if @board[pos[0] - 1, pos[1] + 1].color == 1

    elsif color == 1 && @board[pos[0] + 1, pos[1]].color == 2
      possible_dirs = [[1, 0]]

      unless @has_moved || @board[pos[0] + 2, pos[1]].color != 2
        possible_dirs << [2, 0]
      end

      possible_dirs << [1, 1] if @board[pos[0] + 1, pos[1] + 1].color == 0
      possible_dirs << [1, -1] if @board[pos[0] + 1, pos[1] - 1].color == 0
    end
    possible_dirs
  end
end
