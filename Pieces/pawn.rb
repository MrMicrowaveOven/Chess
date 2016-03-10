class Pawn < Piece
  def initialize(row,col,color)
    @has_moved = false
    super
  end

  def to_s
    color == 0 ? "  ♙  " : "  ♟  "
  end

  def move_dirs
    if color == 0 && @rows[pos[0] - 1, pos[1]].color == false
      possible_dirs = [[-1, 0]]

      unless @has_moved || @rows[pos[0] - 2, pos[1]].color != false
        possible_dirs << [-2, 0]
      end

      possible_dirs << [-1,-1] if @rows[pos[0] - 1, pos[1] - 1].color == 1
      possible_dirs << [-1, 1] if @rows[pos[0] - 1, pos[1] + 1].color == 1

    elsif color == 1 && @rows[pos[0] + 1, pos[1]].color == false
      possible_dirs = [[1, 0]]

      unless @has_moved || @rows[pos[0] + 2, pos[1]].color != false
        possible_dirs << [2, 0]
      end

      possible_dirs << [1, 1] if @rows[pos[0] + 1, pos[1] + 1].color == 0
      possible_dirs << [1, -1] if @rows[pos[0] + 1, pos[1] - 1].color == 0
    end
  end
end
