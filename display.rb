# require_relative 'cursorable'

class Display
  include Cursorable
  attr_accessor :cursor_pos

  def initialize(board)
    @board = board
    # @cursor_pos = [0,0]
  end

  def build_grid
    grid = ["","","","","","","",""]
    8.times do |row|
      8.times do |col|
        grid[row] += self.build_row(row, col, @board[row,col])
        # debugger
      end
    end
    grid
  end

  def build_row(row, col, piece)
      color_options = colors_for(row, col)
      piece.to_s.colorize(color_options)
  end

  def colors_for(i, j)
    if [i, j] == @cursor_pos
      bg = :light_red
    elsif (i + j).odd?
      bg = :pink
    else
      bg = :blue
    end
   { background: bg, color: :white }
  end

  def render(cursor_pos)
    system("clear")
    puts "Fill the grid!"
    puts "Arrow keys to move, space or enter to confirm."
    @cursor_pos = cursor_pos
    build_grid.each do |row|
       puts row
      #  debugger;
    end
    # debugger
  end
end
