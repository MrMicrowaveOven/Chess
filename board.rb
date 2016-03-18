require 'byebug'
require 'colorize'
require 'io/console'
require_relative 'piece'
#requireable includes all pieces and types of pieces, as well as "build_pieces"
require_relative 'requireable'
require_relative 'cursorable'
require_relative 'display' #Erase later

class Board
  attr_accessor :board

  def initialize(game_start = true)
    #Build an 8x8 board.
    #An array filled with 8 arrays, each with 8 empty pieces
    @board = build_board
    #Replace some of the empty pieces with starting pieces.
    #All the pieces
    #Still trying to figure out why game_start is a thing.
    populate if game_start
  end



  def cycle_through_squares(&prc)

  end
  #Makes a board of empty pieces.
  def build_board
    Array.new(8) { |row| Array.new(8) {|col| EmptyPiece.new(2, @board)}}
  end

  #Takes a position ([i,j]), and returns whether it's on the board.
  def in_bounds?(pos)
    row, col = pos
    row.between?(0, 7) && col.between?(0, 7)
  end

  #Takes a position ([i,j]), and returns whether it's empty.
  def is_empty?(pos)
    row, col = pos
    self[row,col].nil? ? true : false
  end

  #I'll get to THIS one later...
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


  #Takes a position and a color (0,1)
  #Returns whether that color piece is at that position.
  #is_empty? is better for color 2 (empty_piece)
  def is_color_piece?(pos, color)
    pos = row, col
    self[row,col].color == color
  end

  def king_finder(color)
    @board.each {|row|row.each do |piece|
        x,y = piece.pos
        return [x,y] if is_king?(x, y, color)
      end
    }
  end

  def is_king?(row, col, king_color)
    @board[row][col].class == King && @board[row][col].color == king_color
  end

  #Because of this, you can do @board[row, col] to indicate @board[row][col]
  def [](row, col)
    @board[row][col]
  end

  #Because of this, you can do @board[row, col]=piece
  #to indicate @board[row][col] = piece
  def []=(row, col, piece)
    @board[row][col] = piece
  end

  def move(start_pos, end_pos)
    srow, scol = start_pos
    erow, ecol = end_pos
    @board[erow, ecol], @board[srow, scol] = @board[srow, scol], @board[erow, ecol]
    @board[srow, scol] = EmptyPiece.new(2, @board)
  end

  def populate
    #These are found in "build_pieces.rb", which is found in "requireable.rb"
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
