require 'byebug'
require 'colorize'
require 'io/console'
require_relative 'piece'
require_relative 'requireable'
require_relative 'cursorable'
require_relative 'display' #Erase later

class Board
  attr_accessor :rows

  def initialize(game_start = true)
    @rows = build_board
    populate if game_start
  end

  def build_board
    Array.new(8) { |row| Array.new(8) {|col| EmptyPiece.new(row, col, false)}}
  end

  def in_bounds?(pos)
    row, col = pos
    row.between?(0, 7) && col.between?(0, 7)
  end

  def is_empty?(pos)
    self[row,col].nil? ? true : false
  end

  def in_check?(color)
    king_position = king_finder(color)
    color == 0 ? opp_color = 1 : opp_color = 0
    64.times do |i|
      piece = whats_here(i)
      if piece.color == opp_color
        return true if piece.valid_moves.include?(king_position)
      end
    end
  end

  def whats_here(num)
    flat = @rows.flatten
    flat[num]
  end

  def is_color_piece?(row, col, color)

  end

  def king_finder(color)
    @rows.each {|row|row.each do |piece|
        x,y = piece.pos
        return [x,y] if is_king?(x, y, color)
      end
    }
  end

  def is_king?(row, col, king_color)
    @rows[row][col].class == King && @rows[row][col].color == king_color
  end

  def [](row, col)
    @rows[row][col]
  end

  def []=(row, col, piece)
    @rows[row][col] = piece
  end

  def move(start, end_pos)

  end

  def populate
    build_knights
    build_queens
    build_kings
    build_bishops
    build_rooks
    build_pawns
  end

  def deep_dup(arr)
    unless arr.is_a?(Array)
      return arr if arr.frozen? || arr.nil?
      return arr.dup
    end
    arr.map { |el| el.deep_dup }
  end

end
# if __FILE__ == $PROGRAM_NAME
#   b = Board.new
#   d = Display.new(b)
#   d.render
# end
